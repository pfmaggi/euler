#ifndef IOTA_VIEW_H_
#define IOTA_VIEW_H_

#include <algorithm>
#include <utility>

class iota_view {
   private:
    int start_;
    int end_;

   public:
    iota_view(int start, int end) : start_(start), end_(end) {}

    struct iterator {
       private:
        int current_;

       public:
        using iterator_category = std::input_iterator_tag;
        using value_type = int;
        using difference_type = std::ptrdiff_t;
        using pointer = const int*;
        using reference = const int&;

        iterator(int current) : current_(current) {}

        int operator*() const { return current_; }
        iterator& operator++() {
            ++current_;
            return *this;
        }
        iterator operator++(int) {
            iterator tmp = *this;
            ++current_;
            return tmp;
        }

        bool operator==(const iterator& other) const {
            return current_ == other.current_;
        }
        bool operator!=(const iterator& other) const {
            return current_ != other.current_;
        }
    };

    iterator begin() const { return iterator(start_); }
    iterator end() const { return iterator(end_); }
};

#endif
