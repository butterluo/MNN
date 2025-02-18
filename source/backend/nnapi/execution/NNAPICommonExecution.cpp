//
//  NNAPICommonExecution.cpp
//  MNN
//
//  Created by MNN on 2022/09/05.
//  Copyright © 2018, Alibaba Group Holding Limited
//

#include "NNAPICommonExecution.hpp"
namespace MNN {

NNAPICommonExecution::NNAPICommonExecution(Backend *backend, const Op *op) : Execution(backend), mOp(op) {
    mNNAPIBackend = (NNAPIBackend*)backend;
    mNCHW = mNNAPIBackend->NCHW();
}

ErrorCode NNAPICommonExecution::onResize(const std::vector<Tensor *> &inputs, const std::vector<Tensor *> &outputs) {
    return NO_ERROR;
}

ErrorCode NNAPICommonExecution::onExecute(const std::vector<Tensor *> &inputs, const std::vector<Tensor *> &outputs) {
    return NO_ERROR;
}

std::vector<uint32_t> NNAPICommonExecution::getTensorIdxs(const std::vector<Tensor*>& tensors) {
    std::vector<uint32_t> idxs(tensors.size());
    for (int i = 0; i < tensors.size(); i++) {
        idxs[i] = mNNAPIBackend->getTensorIdx(tensors[i]);
    }
    return idxs;
}

uint32_t NNAPICommonExecution::buildConstant(const void* data, size_t size, OperandCode dtype, std::vector<uint32_t> dims) {
    return mNNAPIBackend->buildOperand(data, size, dtype, dims);
}

uint32_t NNAPICommonExecution::buildTensor(OperandCode dtype, std::vector<int> dims) {
    std::vector<uint32_t> udims(dims.begin(), dims.end());
    if (!mNCHW) {
        // NCHW -> NHWC
        udims[0] = dims[0];
        udims[1] = dims[2];
        udims[2] = dims[3];
        udims[3] = dims[1];
    }
    return mNNAPIBackend->buildOperand(nullptr, 0, dtype, udims);
}

ErrorCode NNAPICommonExecution::buildOperation(int op, const std::vector<uint32_t> &inputs, const std::vector<uint32_t> &outputs) {
    auto name = mOp->name() ? mOp->name()->c_str() : EnumNameOpType(mOp->type());
    return mNNAPIBackend->buildOperation(op, inputs, outputs, name);
}
}; // namespace MNN
