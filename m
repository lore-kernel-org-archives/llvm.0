Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0410A2F6904;
	Sat,  7 Mar 2026 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772899118; cv=none; b=C/m+Jz6x/yBiK+OVakzO2lSa6svJNBwLijt5LzsmHsl8VUV1y88mW6zyshAJGyhCioU6501OAGpXvQ9jKLPza6W3qmb6NBbUJsKdcc0MX/Wu/eJ4sYE8FDTwNXPSR0loijp0lvM/e639vDsOVw/dyD+NZfsWnRdw7Hm4xVFGOIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772899118; c=relaxed/simple;
	bh=fDc7BaqdNPiRBMVjVzkeIFdpojtQMFJvB3ZYbCaueYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rPbl5DnW6t6zI+mad8XTi8VMeObda9k7mjWF0lG5l6fm+35QuisrpdBlQLR4ryHfMI3UayX9CkjPGnAeHDqiTzH2yUbFExWazAFbJDaa1VifmuYXGCfOqfiqQElrbkUrzKKZ2bnOqBCEBzdXntHTL9ZW9TftP7td/bfyUrkbDdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQmn/vdG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQmn/vdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772899115; x=1804435115;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fDc7BaqdNPiRBMVjVzkeIFdpojtQMFJvB3ZYbCaueYc=;
  b=jQmn/vdGGnm6mKqyNLr7wN+2SSy6KBKGgevAepcBB4JmzE+h+uZBJs1j
   WHB5if4FrGgZNT7bzpWw6cj4Gt66UxhKapfCtqaUmC3/4EHwIYTN54M5T
   XfGqCGYbeuBZ+cnJ+djIf14TqccUHfiGbZgiYN9VymOGCqTyfaE1KAj6L
   Z8VtgvE53KvUNhv/E1lZ5oI3POSeBp9U7vnjtwrnaeOhpyW7deyyLJB2k
   4Q1LoZmKo3v+DcU3CjlMqZ0vwUBXZqW7VWC3Ljqs9N1BZei3/5TWQ6F1Y
   RwAVPwNs19UQ1RNfvoGdX6eEGwXN+qX445ZNcf+F8ScgFlhWakXhox0Uq
   Q==;
X-CSE-ConnectionGUID: 5dRE4X4QRTqVs54Ep06jMg==
X-CSE-MsgGUID: o4eRNy5ISamABnRMVlVrMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="91557560"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="91557560"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 07:58:31 -0800
X-CSE-ConnectionGUID: VusAOqdtT3WFNOrAutokdw==
X-CSE-MsgGUID: 81IYQUONQbKV+D8NI3sCNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="218522879"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2026 07:58:29 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyu2s-0000000028X-2UTD;
	Sat, 07 Mar 2026 15:58:26 +0000
Date: Sat, 07 Mar 2026 23:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-05-5 88/88]
 sound/soc/soc-topology-test.c:48:27: error: field has incomplete type 'struct
 snd_soc_component'
Message-ID: <202603072343.Nv9OTOTw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-05-5
head:   bfb54f3735c9a8e0faed8d460d5051dd1a1eda2d
commit: 4245653edad7843d44522649c3af92184db6d306 [88/88] move component
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260307=
/202603072343.Nv9OTOTw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c=
1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260307/202603072343.Nv9OTOTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603072343.Nv9OTOTw-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-topology-test.c:48:27: error: field has incomplete type 's=
truct snd_soc_component'
      48 |         struct snd_soc_component comp;
         |                                  ^
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   1 error generated.
--
>> sound/soc/soc-ops-test.c:70:27: error: field has incomplete type 'struct=
 snd_soc_component'
      70 |         struct snd_soc_component component;
         |                                  ^
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   1 error generated.
--
>> sound/soc/soc-usb.c:35:21: error: incomplete definition of type 'struct =
snd_soc_component'
      35 |                 if (ctx->component->dev->of_node =3D=3D node)
         |                     ~~~~~~~~~~~~~~^
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   sound/soc/soc-usb.c:75:39: error: incomplete definition of type 'struct =
snd_soc_component'
      75 |         ret =3D snd_soc_card_jack_new(component->card, "USB Offl=
oad Jack",
         |                                     ~~~~~~~~~^
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   sound/soc/soc-usb.c:78:20: error: incomplete definition of type 'struct =
snd_soc_component'
      78 |                 dev_err(component->card->dev, "Unable to add USB=
 offload jack: %d\n",
         |                         ~~~~~~~~~^
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(f=
mt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk=
_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);               =
        \
         |                         ^~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   sound/soc/soc-usb.c:85:20: error: incomplete definition of type 'struct =
snd_soc_component'
      85 |                 dev_err(component->card->dev, "Failed to set jac=
k: %d\n", ret);
         |                         ~~~~~~~~~^
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(f=
mt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk=
_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);               =
        \
         |                         ^~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   4 errors generated.
--
   In file included from sound/soc/soc-core.c:43:
   In file included from include/trace/events/asoc.h:280:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:293:
>> include/trace/events/asoc.h:31:89: error: incomplete definition of type =
'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_=
component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                 =
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/trace/stages/stage5_get_offsets.h:60:27: note: expanded from mac=
ro '__string'
      60 |                     strlen(__string_src(src)) + 1)              =
        \
         |                                         ^~~
   include/linux/fortify-string.h:256:56: note: expanded from macro 'strlen'
     256 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)=
),      \
         |                                                               ^
   include/linux/compiler.h:326:48: note: expanded from macro '__is_constex=
pr'
     326 |         (sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(x) * 0=
l)) : (int *)8)))
         |                                                       ^
   include/trace/stages/stage5_get_offsets.h:52:19: note: expanded from mac=
ro '__dynamic_array'
      52 |         __item_length =3D (len) * sizeof(type);                 =
          \
         |                          ^~~
   include/trace/stages/stage1_struct_define.h:60:35: note: expanded from m=
acro 'TP_STRUCT__entry'
      60 | #define TP_STRUCT__entry(args...) args
         |                                   ^~~~
   include/trace/trace_events.h:285:2: note: expanded from macro 'DECLARE_E=
VENT_CLASS'
     285 |         tstruct;                                                =
        \
         |         ^~~~~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   In file included from sound/soc/soc-core.c:43:
   In file included from include/trace/events/asoc.h:280:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:293:
>> include/trace/events/asoc.h:31:89: error: incomplete definition of type =
'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_=
component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                 =
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/trace/stages/stage5_get_offsets.h:60:27: note: expanded from mac=
ro '__string'
      60 |                     strlen(__string_src(src)) + 1)              =
        \
         |                                         ^~~
   include/linux/fortify-string.h:257:20: note: expanded from macro 'strlen'
     257 |                 __builtin_strlen(p), __fortify_strlen(p))
         |                                  ^
   include/trace/stages/stage5_get_offsets.h:52:19: note: expanded from mac=
ro '__dynamic_array'
      52 |         __item_length =3D (len) * sizeof(type);                 =
          \
         |                          ^~~
   include/trace/stages/stage1_struct_define.h:60:35: note: expanded from m=
acro 'TP_STRUCT__entry'
      60 | #define TP_STRUCT__entry(args...) args
         |                                   ^~~~
   include/trace/trace_events.h:285:2: note: expanded from macro 'DECLARE_E=
VENT_CLASS'
     285 |         tstruct;                                                =
        \
         |         ^~~~~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   In file included from sound/soc/soc-core.c:43:
   In file included from include/trace/events/asoc.h:280:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:293:
>> include/trace/events/asoc.h:31:89: error: incomplete definition of type =
'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_=
component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                 =
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/trace/stages/stage5_get_offsets.h:60:27: note: expanded from mac=
ro '__string'
      60 |                     strlen(__string_src(src)) + 1)              =
        \
         |                                         ^~~
   include/linux/fortify-string.h:257:41: note: expanded from macro 'strlen'
     257 |                 __builtin_strlen(p), __fortify_strlen(p))
         |                                                       ^
   include/trace/stages/stage5_get_offsets.h:52:19: note: expanded from mac=
ro '__dynamic_array'
      52 |         __item_length =3D (len) * sizeof(type);                 =
          \
         |                          ^~~
   include/trace/stages/stage1_struct_define.h:60:35: note: expanded from m=
acro 'TP_STRUCT__entry'
      60 | #define TP_STRUCT__entry(args...) args
         |                                   ^~~~
   include/trace/trace_events.h:285:2: note: expanded from macro 'DECLARE_E=
VENT_CLASS'
     285 |         tstruct;                                                =
        \
         |         ^~~~~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   In file included from sound/soc/soc-core.c:43:
   In file included from include/trace/events/asoc.h:280:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:293:
>> include/trace/events/asoc.h:31:89: error: incomplete definition of type =
'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_=
component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                 =
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/trace/stages/stage5_get_offsets.h:61:32: note: expanded from mac=
ro '__string'
      61 |         __data_offsets->item##_ptr_ =3D src;
         |                                       ^~~
   include/trace/stages/stage1_struct_define.h:60:35: note: expanded from m=
acro 'TP_STRUCT__entry'
      60 | #define TP_STRUCT__entry(args...) args
         |                                   ^~~~
   include/trace/trace_events.h:285:2: note: expanded from macro 'DECLARE_E=
VENT_CLASS'
     285 |         tstruct;                                                =
        \
         |         ^~~~~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
>> sound/soc/soc-core.c:132:2: error: incomplete definition of type 'struct=
 snd_soc_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:782:13: note: expanded from macro 'list_for_each_en=
try'
     782 |         for (pos =3D list_first_entry(head, typeof(*pos), member=
);        \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:620:2: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:617:74: note: expanded from macro '__same=
_type'
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a)=
, typeof(b))
         |                                                                 =
         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_asser=
t'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_ass=
ert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
>> sound/soc/soc-core.c:132:2: error: offsetof of incomplete type 'typeof (=
*component)' (aka 'struct snd_soc_component')
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:782:13: note: expanded from macro 'list_for_each_en=
try'
     782 |         for (pos =3D list_first_entry(head, typeof(*pos), member=
);        \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:620:2: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:2: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container=
_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
>> sound/soc/soc-core.c:132:2: error: assigning to 'struct snd_soc_componen=
t *' from incompatible type 'void'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:782:11: note: expanded from macro 'list_for_each_en=
try'
     782 |         for (pos =3D list_first_entry(head, typeof(*pos), member=
);        \
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/soc-core.c:132:2: error: incomplete definition of type 'struct=
 snd_soc_component'
     132 |         for_each_component(component)
         |         ^                  ~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^                   ~~~~~~~~~
   include/linux/list.h:783:8: note: expanded from macro 'list_for_each_ent=
ry'
     783 |              !list_entry_is_head(pos, head, member);            =
        \
         |               ^                  ~~~
   include/linux/list.h:773:19: note: expanded from macro 'list_entry_is_he=
ad'
     773 |         list_is_head(&pos->member, (head))
         |                       ~~~^
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
>> sound/soc/soc-core.c:132:2: error: incomplete definition of type 'struct=
 snd_soc_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:784:13: note: expanded from macro 'list_for_each_en=
try'
     784 |              pos =3D list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:18: note: expanded from macro 'list_next_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:26: note: expanded from macro 'container=
_of'
      20 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |                                 ^~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
>> sound/soc/soc-core.c:132:2: error: incomplete definition of type 'struct=
 snd_soc_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:784:13: note: expanded from macro 'list_for_each_en=
try'
     784 |              pos =3D list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:18: note: expanded from macro 'list_next_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:617:63: note: expanded from macro '__same=
_type'
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a)=
, typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_asser=
t'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_ass=
ert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
>> sound/soc/soc-core.c:132:2: error: incomplete definition of type 'struct=
 snd_soc_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:784:13: note: expanded from macro 'list_for_each_en=
try'
     784 |              pos =3D list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:18: note: expanded from macro 'list_next_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:617:63: note: expanded from macro '__same=
_type'
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a)=
, typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_asser=
t'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_ass=
ert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
>> sound/soc/soc-core.c:132:2: error: offsetof of incomplete type 'typeof (=
*(component))' (aka 'struct snd_soc_component')
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:784:13: note: expanded from macro 'list_for_each_en=
try'
     784 |              pos =3D list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:2: note: expanded from macro 'list_next_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:2: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container=
_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
>> sound/soc/soc-core.c:132:2: error: assigning to 'struct snd_soc_componen=
t *' from incompatible type 'void'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:784:11: note: expanded from macro 'list_for_each_en=
try'
     784 |              pos =3D list_next_entry(pos, member))
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:2: error: incomplete definition of type 'struct=
 snd_soc_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:782:13: note: expanded from macro 'list_for_each_en=
try'
     782 |         for (pos =3D list_first_entry(head, typeof(*pos), member=
);        \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:620:2: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:617:74: note: expanded from macro '__same=
_type'
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a)=
, typeof(b))
         |                                                                 =
         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_asser=
t'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_ass=
ert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   sound/soc/soc-core.c:145:2: error: offsetof of incomplete type 'typeof (=
*component)' (aka 'struct snd_soc_component')
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:782:13: note: expanded from macro 'list_for_each_en=
try'
     782 |         for (pos =3D list_first_entry(head, typeof(*pos), member=
);        \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:620:2: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:2: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container=
_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   sound/soc/soc-core.c:145:2: error: assigning to 'struct snd_soc_componen=
t *' from incompatible type 'void'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:782:11: note: expanded from macro 'list_for_each_en=
try'
     782 |         for (pos =3D list_first_entry(head, typeof(*pos), member=
);        \
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:2: error: incomplete definition of type 'struct=
 snd_soc_component'
     145 |         for_each_component(component)
         |         ^                  ~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^                   ~~~~~~~~~
   include/linux/list.h:783:8: note: expanded from macro 'list_for_each_ent=
ry'
     783 |              !list_entry_is_head(pos, head, member);            =
        \
         |               ^                  ~~~
   include/linux/list.h:773:19: note: expanded from macro 'list_entry_is_he=
ad'
     773 |         list_is_head(&pos->member, (head))
         |                       ~~~^
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
     416 | struct snd_soc_component;
         |        ^
   sound/soc/soc-core.c:145:2: error: incomplete definition of type 'struct=
 snd_soc_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:2: note: expanded from macro 'for_each_component'
      44 |         list_for_each_entry(component, soc_component_get_list_he=
ad(), list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/list.h:784:13: note: expanded from macro 'list_for_each_en=
try'
     784 |              pos =3D list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:18: note: expanded from macro 'list_next_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:26: note: expanded from macro 'container=
_of'
      20 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |                                 ^~~
   include/sound/soc.h:416:8: note: forward declaration of 'struct snd_soc_=
component'
..


vim +48 sound/soc/soc-topology-test.c

d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  39 =20
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  40  /*
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  41   * helper struc=
t we use when registering component, as we load topology during
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  42   * component pr=
obe, we need to pass struct kunit somehow to probe function, so
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  43   * we can repor=
t test result
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  44   */
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  45  struct kunit_so=
c_component {
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  46  	struct kunit *=
kunit;
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  47  	int expect; /*=
 what result we expect when loading topology */
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20 @48  	struct snd_soc=
_component comp;
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  49  	struct snd_soc=
_card card;
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  50  	struct firmwar=
e fw;
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  51  };
d52bbf747cfa8a Amadeusz S=C5=82awi=C5=84ski 2021-01-20  52 =20

:::::: The code at line 48 was first introduced by commit
:::::: d52bbf747cfa8a2988289009241214a84982cc7d ASoC: topology: KUnit: Add =
KUnit tests passing various arguments to snd_soc_tplg_component_load

:::::: TO: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.co=
m>
:::::: CC: Mark Brown <broonie@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
