Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E87310F2;
	Tue, 15 Nov 2022 02:38:34 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id 46-20020a9d0631000000b00666823da25fso7848920otn.0;
        Mon, 14 Nov 2022 18:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CNgoloRHzZMsDWnsYLpa+l3EoqBa7OBSLSeNlxWa7/E=;
        b=o0oc6jQnHTAj5PiQMljDUatCs/JoAsmmP2i4tff3gh75/g5/DvwhV+p8N3GIBKxC46
         jP5C1CW5hV6MyhG9A7noaPO+EqC/XR31ffDZTJYm1E7pPLQO3Qie1B5T7IexjUiUpPWd
         aQ+TOO8C2Whvq8vtYTlaHzoTEhYZm0RZ9+XRp4/NS0IOPqWyzXC5VNoZqIopwHO1NRFR
         3bBWprIWF2wg/qG6r2jRqthixSYl7F+gkBhIQJf49QmkeyK8anl/vEQXtAGCHR3pD4pY
         EqybQEgr9hAjTdZ746WUDfe5ZJmaGZYqz07FVC+aUtDniR74wzWWTPJLoFyA3BOD5Ysi
         UfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNgoloRHzZMsDWnsYLpa+l3EoqBa7OBSLSeNlxWa7/E=;
        b=B4qXePOnKl4bS3Sgb8FFMOWD+dGAxBHVa4tUqhkJr+wBe1uE8odKlTzSmeRwnJAChn
         YDYzsiFGqA82OAgPV6YjVMlc8AC9DsQPxIRPP2E/R8Oyl56XnOLDpuH0goOiLiRpekKd
         zNhK7af212eBhoXFBwhF+AYfjXHQTHvwMTzFS5XVH4ofJ3ud1HaaW7GEYEbWpgbgnpHb
         Kg97DwYoTmYXZ/kcQLJeM0manvR9d/m6LvQ9W1pmhFIrk7m8W3SNMqi0XrdVrqdrCloL
         pFrin/1bzZ/qKSvJEMu636okl36xPHgM4cHfutkBRyyTkemB+O4UWCCd0+9RmZO9dyHl
         S83A==
X-Gm-Message-State: ANoB5pmWB7sXOphsLObQf0aRYNEAQrgu2gz4aySWsCUPuiHe7YAUkI1B
	9alagiGXDwyJL+eJ1oZNwRsw1d4nlgLpv49qtvk=
X-Google-Smtp-Source: AA0mqf70xWI2EXAeen558Z8pctKoEibYBVFDF/G25jyN34rSzF4jJgc7ni235tXoaY0mJZ3CC+AiIQiOz+iz0mB8zQA=
X-Received: by 2002:a9d:5a0d:0:b0:66c:50ce:2a2f with SMTP id
 v13-20020a9d5a0d000000b0066c50ce2a2fmr8306774oth.46.1668479913990; Mon, 14
 Nov 2022 18:38:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <86dfdc49613ca8a8a6a3d7c7cf2e7bd8207338f2.1668357542.git.lucien.xin@gmail.com>
 <202211140427.Bd5Zjdbe-lkp@intel.com>
In-Reply-To: <202211140427.Bd5Zjdbe-lkp@intel.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 14 Nov 2022 21:38:00 -0500
Message-ID: <CADvbK_ezonDWaT5fUdc0w5+y91PEaHc8YveV8KGyBC7sH3fWmw@mail.gmail.com>
Subject: Re: [PATCH net-next 5/7] sctp: add dif and sdif check in asoc and ep lookup
To: kernel test robot <lkp@intel.com>
Cc: network dev <netdev@vger.kernel.org>, linux-sctp@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Neil Horman <nhorman@tuxdriver.com>, 
	David Ahern <dsahern@gmail.com>, Carlo Carraro <colrack@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 13, 2022 at 3:15 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Xin,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on net-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Long/sctp-support-vrf-processing/20221114-004540
> patch link:    https://lore.kernel.org/r/86dfdc49613ca8a8a6a3d7c7cf2e7bd8207338f2.1668357542.git.lucien.xin%40gmail.com
> patch subject: [PATCH net-next 5/7] sctp: add dif and sdif check in asoc and ep lookup
> config: arm-randconfig-r034-20221114
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 463da45892e2d2a262277b91b96f5f8c05dc25d0)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://github.com/intel-lab-lkp/linux/commit/6129dc2e382c6e2d3198f6c32cc1f750a15a77ab
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Xin-Long/sctp-support-vrf-processing/20221114-004540
>         git checkout 6129dc2e382c6e2d3198f6c32cc1f750a15a77ab
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/openvswitch/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from net/openvswitch/actions.c:26:
>    In file included from include/net/sctp/checksum.h:27:
> >> include/net/sctp/sctp.h:686:35: error: no member named 'sctp' in 'struct net'
>            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
>                                        ~~~  ^
The build disabled IP_SCTP, while net/sctp/sctp.h is included in other modules.
Instead of "net/sctp/sctp.h", "linux/sctp.h" should be included, I
will send another patch series to fix them.

We do NOT need to change anything in this series.

Thanks.

>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
>            compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>                                             ^
>    include/linux/compiler_types.h:324:10: note: expanded from macro '__native_word'
>            (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
>                    ^
>    include/linux/compiler_types.h:357:22: note: expanded from macro 'compiletime_assert'
>            _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                ^~~~~~~~~
>    include/linux/compiler_types.h:345:23: note: expanded from macro '_compiletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>                                 ^~~~~~~~~
>    include/linux/compiler_types.h:337:9: note: expanded from macro '__compiletime_assert'
>                    if (!(condition))                                       \
>                          ^~~~~~~~~
>    In file included from net/openvswitch/actions.c:26:
>    In file included from include/net/sctp/checksum.h:27:
> >> include/net/sctp/sctp.h:686:35: error: no member named 'sctp' in 'struct net'
>            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
>                                        ~~~  ^
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
>            compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>                                             ^
>    include/linux/compiler_types.h:324:39: note: expanded from macro '__native_word'
>            (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
>                                                 ^
>    include/linux/compiler_types.h:357:22: note: expanded from macro 'compiletime_assert'
>            _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                ^~~~~~~~~
>    include/linux/compiler_types.h:345:23: note: expanded from macro '_compiletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>                                 ^~~~~~~~~
>    include/linux/compiler_types.h:337:9: note: expanded from macro '__compiletime_assert'
>                    if (!(condition))                                       \
>                          ^~~~~~~~~
>    In file included from net/openvswitch/actions.c:26:
>    In file included from include/net/sctp/checksum.h:27:
> >> include/net/sctp/sctp.h:686:35: error: no member named 'sctp' in 'struct net'
>            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
>                                        ~~~  ^
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
>            compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>                                             ^
>    include/linux/compiler_types.h:325:10: note: expanded from macro '__native_word'
>             sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
>                    ^
>    include/linux/compiler_types.h:357:22: note: expanded from macro 'compiletime_assert'
>            _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                ^~~~~~~~~
>    include/linux/compiler_types.h:345:23: note: expanded from macro '_compiletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>                                 ^~~~~~~~~
>    include/linux/compiler_types.h:337:9: note: expanded from macro '__compiletime_assert'
>                    if (!(condition))                                       \
>                          ^~~~~~~~~
>    In file included from net/openvswitch/actions.c:26:
>    In file included from include/net/sctp/checksum.h:27:
> >> include/net/sctp/sctp.h:686:35: error: no member named 'sctp' in 'struct net'
>            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
>                                        ~~~  ^
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
>            compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>                                             ^
>    include/linux/compiler_types.h:325:38: note: expanded from macro '__native_word'
>             sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
>                                                ^
>    include/linux/compiler_types.h:357:22: note: expanded from macro 'compiletime_assert'
>            _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                ^~~~~~~~~
>    include/linux/compiler_types.h:345:23: note: expanded from macro '_compiletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>                                 ^~~~~~~~~
>    include/linux/compiler_types.h:337:9: note: expanded from macro '__compiletime_assert'
>                    if (!(condition))                                       \
>                          ^~~~~~~~~
>    In file included from net/openvswitch/actions.c:26:
>    In file included from include/net/sctp/checksum.h:27:
> >> include/net/sctp/sctp.h:686:35: error: no member named 'sctp' in 'struct net'
>            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
>                                        ~~~  ^
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
>            compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>                                                          ^
>    include/linux/compiler_types.h:357:22: note: expanded from macro 'compiletime_assert'
>            _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                ^~~~~~~~~
>    include/linux/compiler_types.h:345:23: note: expanded from macro '_compiletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>                                 ^~~~~~~~~
>    include/linux/compiler_types.h:337:9: note: expanded from macro '__compiletime_assert'
>                    if (!(condition))                                       \
>                          ^~~~~~~~~
>    In file included from net/openvswitch/actions.c:26:
>    In file included from include/net/sctp/checksum.h:27:
> >> include/net/sctp/sctp.h:686:35: error: no member named 'sctp' in 'struct net'
>            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
>                                        ~~~  ^
>    include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>            __READ_ONCE(x);                                                 \
>                        ^
>    include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
>    #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>                                                                     ^
>    include/linux/compiler_types.h:313:13: note: expanded from macro '__unqual_scalar_typeof'
>                    _Generic((x),                                           \
>                              ^
>    In file included from net/openvswitch/actions.c:26:
>    In file included from include/net/sctp/checksum.h:27:
> >> include/net/sctp/sctp.h:686:35: error: no member named 'sctp' in 'struct net'
>            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
>                                        ~~~  ^
>    include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>            __READ_ONCE(x);                                                 \
>                        ^
>    include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
>    #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>                                                                     ^
>    include/linux/compiler_types.h:320:15: note: expanded from macro '__unqual_scalar_typeof'
>                             default: (x)))
>                                       ^
>    In file included from net/openvswitch/actions.c:26:
>    In file included from include/net/sctp/checksum.h:27:
> >> include/net/sctp/sctp.h:686:35: error: no member named 'sctp' in 'struct net'
>            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
>                                        ~~~  ^
>    include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>            __READ_ONCE(x);                                                 \
>                        ^
>    include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
>    #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>                                                                            ^
>    In file included from net/openvswitch/actions.c:26:
>    In file included from include/net/sctp/checksum.h:27:
> >> include/net/sctp/sctp.h:686:19: error: invalid argument type 'void' to unary expression
>            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
>                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    9 errors generated.
>
>
> vim +686 include/net/sctp/sctp.h
>
>    679
>    680  static inline bool sctp_sk_bound_dev_eq(struct net *net, int bound_dev_if,
>    681                                          int dif, int sdif)
>    682  {
>    683          bool l3mdev_accept = true;
>    684
>    685  #if IS_ENABLED(CONFIG_NET_L3_MASTER_DEV)
>  > 686          l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
>    687  #endif
>    688          return inet_bound_dev_eq(l3mdev_accept, bound_dev_if, dif, sdif);
>    689  }
>    690
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
