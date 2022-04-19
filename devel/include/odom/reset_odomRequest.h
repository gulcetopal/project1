// Generated by gencpp from file odom/reset_odomRequest.msg
// DO NOT EDIT!


#ifndef ODOM_MESSAGE_RESET_ODOMREQUEST_H
#define ODOM_MESSAGE_RESET_ODOMREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace odom
{
template <class ContainerAllocator>
struct reset_odomRequest_
{
  typedef reset_odomRequest_<ContainerAllocator> Type;

  reset_odomRequest_()
    : new_x(0.0)
    , new_y(0.0)
    , new_yaw(0.0)  {
    }
  reset_odomRequest_(const ContainerAllocator& _alloc)
    : new_x(0.0)
    , new_y(0.0)
    , new_yaw(0.0)  {
  (void)_alloc;
    }



   typedef double _new_x_type;
  _new_x_type new_x;

   typedef double _new_y_type;
  _new_y_type new_y;

   typedef double _new_yaw_type;
  _new_yaw_type new_yaw;





  typedef boost::shared_ptr< ::odom::reset_odomRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::odom::reset_odomRequest_<ContainerAllocator> const> ConstPtr;

}; // struct reset_odomRequest_

typedef ::odom::reset_odomRequest_<std::allocator<void> > reset_odomRequest;

typedef boost::shared_ptr< ::odom::reset_odomRequest > reset_odomRequestPtr;
typedef boost::shared_ptr< ::odom::reset_odomRequest const> reset_odomRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::odom::reset_odomRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::odom::reset_odomRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::odom::reset_odomRequest_<ContainerAllocator1> & lhs, const ::odom::reset_odomRequest_<ContainerAllocator2> & rhs)
{
  return lhs.new_x == rhs.new_x &&
    lhs.new_y == rhs.new_y &&
    lhs.new_yaw == rhs.new_yaw;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::odom::reset_odomRequest_<ContainerAllocator1> & lhs, const ::odom::reset_odomRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace odom

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::odom::reset_odomRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::odom::reset_odomRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::odom::reset_odomRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::odom::reset_odomRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::odom::reset_odomRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::odom::reset_odomRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::odom::reset_odomRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2f2a014aa06478f778bb22ed471b089d";
  }

  static const char* value(const ::odom::reset_odomRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2f2a014aa06478f7ULL;
  static const uint64_t static_value2 = 0x78bb22ed471b089dULL;
};

template<class ContainerAllocator>
struct DataType< ::odom::reset_odomRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "odom/reset_odomRequest";
  }

  static const char* value(const ::odom::reset_odomRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::odom::reset_odomRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 new_x\n"
"float64 new_y\n"
"float64 new_yaw\n"
;
  }

  static const char* value(const ::odom::reset_odomRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::odom::reset_odomRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.new_x);
      stream.next(m.new_y);
      stream.next(m.new_yaw);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct reset_odomRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::odom::reset_odomRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::odom::reset_odomRequest_<ContainerAllocator>& v)
  {
    s << indent << "new_x: ";
    Printer<double>::stream(s, indent + "  ", v.new_x);
    s << indent << "new_y: ";
    Printer<double>::stream(s, indent + "  ", v.new_y);
    s << indent << "new_yaw: ";
    Printer<double>::stream(s, indent + "  ", v.new_yaw);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ODOM_MESSAGE_RESET_ODOMREQUEST_H
