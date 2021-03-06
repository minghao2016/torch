#include <iostream>

#define LANTERN_BUILD

#include "lantern/lantern.h"

#include <torch/torch.h>

#include "utils.hpp"

void *_lantern_vector_int64_t(int64_t *x, size_t x_size)
{
  LANTERN_FUNCTION_START
  auto out = std::vector<int64_t>(x, x + x_size);
  return (void *)new LanternObject<std::vector<int64_t>>(out);
  LANTERN_FUNCTION_END
}

void *_lantern_IntArrayRef(int64_t *x, size_t x_size)
{
  LANTERN_FUNCTION_START
  torch::IntArrayRef out = std::vector<int64_t>(x, x + x_size);
  return (void *)new LanternObject<torch::IntArrayRef>(out);
  LANTERN_FUNCTION_END
}

void *_lantern_int(int x)
{
  LANTERN_FUNCTION_START
  return (void *)new LanternObject<int>(x);
  LANTERN_FUNCTION_END
}

void *_lantern_int64_t(int64_t x)
{
  LANTERN_FUNCTION_START
  return (void *)new LanternObject<int64_t>(x);
  LANTERN_FUNCTION_END
}

void *_lantern_double(double x)
{
  LANTERN_FUNCTION_START
  return (void *)new LanternObject<double>(x);
  LANTERN_FUNCTION_END
}

void *_lantern_optional_double(double x, bool is_null)
{
  LANTERN_FUNCTION_START
  c10::optional<double> out;
  if (is_null)
    out = c10::nullopt;
  else
    out = x;

  return (void *)new LanternObject<c10::optional<double>>(out);
  LANTERN_FUNCTION_END
}

void *_lantern_optional_int64_t(int64_t x, bool is_null)
{
  LANTERN_FUNCTION_START
  c10::optional<int64_t> out;
  if (is_null)
    out = c10::nullopt;
  else
    out = x;

  return (void *)new LanternObject<c10::optional<int64_t>>(out);
  LANTERN_FUNCTION_END
}

void *_lantern_bool(bool x)
{
  LANTERN_FUNCTION_START
  return (void *)new LanternObject<bool>(x);
  LANTERN_FUNCTION_END
}

void *_lantern_vector_get(void *x, int i)
{
  LANTERN_FUNCTION_START
  auto v = reinterpret_cast<LanternObject<std::vector<void *>> *>(x)->get();
  return v.at(i);
  LANTERN_FUNCTION_END
}

void *_lantern_Tensor_undefined()
{
  LANTERN_FUNCTION_START
  torch::Tensor x = {};
  return (void *)new LanternObject<torch::Tensor>(x);
  LANTERN_FUNCTION_END
}

void *_lantern_vector_string_new()
{
  LANTERN_FUNCTION_START
  return (void *)new std::vector<std::string>();
  LANTERN_FUNCTION_END
}

void _lantern_vector_string_push_back(void *self, const char *x)
{
  LANTERN_FUNCTION_START
  reinterpret_cast<std::vector<std::string> *>(self)->push_back(std::string(x));
  LANTERN_FUNCTION_END_VOID
}

int64_t _lantern_vector_string_size(void *self)
{
  LANTERN_FUNCTION_START
  return reinterpret_cast<std::vector<std::string> *>(self)->size();
  LANTERN_FUNCTION_END_RET(0)
}

const char *_lantern_vector_string_at(void *self, int64_t i)
{
  LANTERN_FUNCTION_START
  return reinterpret_cast<std::vector<std::string> *>(self)->at(i).c_str();
  LANTERN_FUNCTION_END
}

void *_lantern_vector_bool_new()
{
  LANTERN_FUNCTION_START
  return (void *)new std::vector<bool>();
  LANTERN_FUNCTION_END
}

void _lantern_vector_bool_push_back(void *self, bool x)
{
  LANTERN_FUNCTION_START
  reinterpret_cast<std::vector<bool> *>(self)->push_back(x);
  LANTERN_FUNCTION_END_VOID
}

int64_t _lantern_vector_bool_size(void *self)
{
  LANTERN_FUNCTION_START
  return reinterpret_cast<std::vector<bool> *>(self)->size();
  LANTERN_FUNCTION_END_RET(0)
}

bool _lantern_vector_bool_at(void *self, int64_t i)
{
  LANTERN_FUNCTION_START
  return reinterpret_cast<std::vector<bool> *>(self)->at(i);
  LANTERN_FUNCTION_END_RET(false)
}
