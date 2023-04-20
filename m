Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38EE8492;
	Thu, 20 Apr 2023 13:34:19 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2a8ba5f1d6bso5013041fa.2;
        Thu, 20 Apr 2023 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681997658; x=1684589658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBx+eefuD3mlwASOnAXXaphvTZnbQD+D9i1G2I4aLj8=;
        b=qmB7IgRNrOg7Yiy3/TCCuLJTdZB4SeCbSJttL+VR1cUJ04+ObsDD9YNoCesG+AnTHJ
         aTeVhRRCY5DH9nEbVtHUHA46SG7WHzuheX2uLfll+cHdp7LAjEqFRzwamv7j4ZRlpYWo
         LEWj3a6svuA2UrbTejkMtUNjhba6LI+KwaWc5ejbGx99wt79qmebAVLxUZp0cn6zBI/d
         r+iWKXXsu5bcz9v81h5zaXe2/YBUu1c/lwRSqIOnlFrtvbsetPjfOWpUPQm8WBbBU2Rd
         dJoZoLwtjUfqSjMspUZ7yJoKBkIURWO4PLxVccPS+Xc8LISsIDwtU5IcglUK/Ea+MJas
         QJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681997658; x=1684589658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBx+eefuD3mlwASOnAXXaphvTZnbQD+D9i1G2I4aLj8=;
        b=AH3mhpbcFDQ0c/+g9rbgNls1uIK+fxOQ58GFNuJOd8DgeUJJ0xS8PUkMEHqGIaLUok
         Omii2fCwDJfQ8xvx/9Eg49kAo3LNTm5FaSaY0WticVc6PQoSGI9T/A9+MOFF4uX6khd6
         r5mr5r1sQe3KN08AMLuuboIlrz03uala2d5x2AVsiSIfDkDhAtSeodcVIOcsjcupsjXm
         STjQJIldi0arW8u3KUL4E2JUBornkcl5N0Er2O7HVI0/iryMEDJ/6H196A3KQWmOQsh9
         7znE6sZzutmXEwRF/XV1ZMZ9x9qXPUIRlg6SOQxquHRtZcUZECwU42hm6RUwjiMkQPZO
         Fr+g==
X-Gm-Message-State: AAQBX9c+4oNquvxNOqYfaKXOfFvugOBRUw7/kfYbM9lfcjy00UZ0PcFF
	uDLcHwNEL0emR11ogdM5WbLy7TSVNs6PtdDf84I=
X-Google-Smtp-Source: AKy350btAzYnXLlPTv04Y7unRU8YAvfOdqZn0Lxv4Zt4Os2OAzHN86GYf4hNuxyadHt2aEVCWzfucLKCiIJ2BZ7vVzA=
X-Received: by 2002:a19:ee0e:0:b0:4ea:e799:59f7 with SMTP id
 g14-20020a19ee0e000000b004eae79959f7mr393073lfb.2.1681997657435; Thu, 20 Apr
 2023 06:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230419151321.6167-14-jorge.lopez2@hp.com> <202304200914.VfJcRutc-lkp@intel.com>
In-Reply-To: <202304200914.VfJcRutc-lkp@intel.com>
From: Jorge Lopez <jorgealtxwork@gmail.com>
Date: Thu, 20 Apr 2023 08:33:54 -0500
Message-ID: <CAOOmCE_+UL31C50Md-eV5H76jy2Ta1q1xB7b=QqdNU95Q4y6fw@mail.gmail.com>
Subject: Re: [PATCH v10 13/14] HP BIOSCFG driver - Makefile
To: kernel test robot <lkp@intel.com>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas@t-8ch.de, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you.  I will address those issues.

Regards,

Jorge

On Wed, Apr 19, 2023 at 8:45=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Jorge,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.3-rc7 next-20230419]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jorge-Lopez/HP-BIO=
SCFG-driver-Documentation/20230419-231828
> patch link:    https://lore.kernel.org/r/20230419151321.6167-14-jorge.lop=
ez2%40hp.com
> patch subject: [PATCH v10 13/14] HP BIOSCFG driver  - Makefile
> config: i386-randconfig-a015-20230417 (https://download.01.org/0day-ci/ar=
chive/20230420/202304200914.VfJcRutc-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c=
006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/cfbebfbd4ed15793f=
ab894715bfd74387adcf4f1
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Jorge-Lopez/HP-BIOSCFG-driver-Do=
cumentation/20230419-231828
>         git checkout cfbebfbd4ed15793fab894715bfd74387adcf4f1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Di386 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/platform/x86/hp/hp=
-bioscfg/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304200914.VfJcRutc-lkp@i=
ntel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:141:2: warni=
ng: variable 'id' is used uninitialized whenever 'if' condition is true [-W=
sometimes-uninitialized]
>            if (!buf_cp) {
>            ^~~~~~~~~~~~
>    include/linux/compiler.h:56:28: note: expanded from macro 'if'
>    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) )=
 )
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_=
var'
>    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __=
trace_if_value(cond))
>                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
>    drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:169:18: note=
: uninitialized use occurs here
>            clear_passwords(id);
>                            ^~
>    drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:141:2: note:=
 remove the 'if' if its condition is always false
>            if (!buf_cp) {
>            ^~~~~~~~~~~~~~
>    include/linux/compiler.h:56:23: note: expanded from macro 'if'
>    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) )=
 )
>                          ^
>    drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:138:8: note:=
 initialize the variable 'id' to silence this warning
>            int id, ret =3D -EIO;
>                  ^
>                   =3D 0
>    1 warning generated.
> --
> >> drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:76:2: warning:=
 variable 'ret' is used uninitialized whenever 'if' condition is true [-Wso=
metimes-uninitialized]
>            if (!start)
>            ^~~~~~~~~~~
>    include/linux/compiler.h:56:28: note: expanded from macro 'if'
>    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) )=
 )
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_=
var'
>    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __=
trace_if_value(cond))
>                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
>    drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:87:9: note: un=
initialized use occurs here
>            return ret;
>                   ^~~
>    drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:76:2: note: re=
move the 'if' if its condition is always false
>            if (!start)
>            ^~~~~~~~~~~
>    include/linux/compiler.h:56:23: note: expanded from macro 'if'
>    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) )=
 )
>                          ^
>    drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:72:2: warning:=
 variable 'ret' is used uninitialized whenever 'if' condition is true [-Wso=
metimes-uninitialized]
>            if (!start)
>            ^~~~~~~~~~~
>    include/linux/compiler.h:56:28: note: expanded from macro 'if'
>    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) )=
 )
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_=
var'
>    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __=
trace_if_value(cond))
>                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
>    drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:87:9: note: un=
initialized use occurs here
>            return ret;
>                   ^~~
>    drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:72:2: note: re=
move the 'if' if its condition is always false
>            if (!start)
>            ^~~~~~~~~~~
>    include/linux/compiler.h:56:23: note: expanded from macro 'if'
>    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) )=
 )
>                          ^
>    drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:43:2: warning:=
 variable 'ret' is used uninitialized whenever 'if' condition is true [-Wso=
metimes-uninitialized]
>            if (instance < 0)
>            ^~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:56:28: note: expanded from macro 'if'
>    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) )=
 )
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_=
var'
>    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __=
trace_if_value(cond))
>                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
>    drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:87:9: note: un=
initialized use occurs here
>            return ret;
>                   ^~~
>    drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:43:2: note: re=
move the 'if' if its condition is always false
>            if (instance < 0)
>            ^~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:56:23: note: expanded from macro 'if'
>    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) )=
 )
>                          ^
>    drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:30:9: note: in=
itialize the variable 'ret' to silence this warning
>            int ret;
>                   ^
>                    =3D 0
>    3 warnings generated.
>
>
> vim +141 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
>
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  132
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  133  static ssize_t new_password_s=
tore(struct kobject *kobj,
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  134                               =
 struct kobj_attribute *attr,
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  135                               =
 const char *buf, size_t count)
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  136  {
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  137      char *p, *buf_cp =3D NULL=
;
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  138      int id, ret =3D -EIO;
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  139
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  140      buf_cp =3D kstrdup(buf, G=
FP_KERNEL);
> 1780f5eca27fb8 Jorge Lopez 2023-04-19 @141      if (!buf_cp) {
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  142              ret =3D -ENOMEM;
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  143              goto exit_passwor=
d;
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  144      }
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  145
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  146      p =3D memchr(buf_cp, '\n'=
, count);
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  147
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  148      if (p !=3D NULL)
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  149              *p =3D '\0';
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  150
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  151      id =3D get_password_insta=
nce_id(kobj);
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  152
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  153      if (id >=3D 0)
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  154              ret =3D validate_=
password_input(id, buf_cp);
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  155
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  156      if (!ret)
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  157              strscpy(bioscfg_d=
rv.password_data[id].new_password,
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  158                      buf_cp,
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  159                      sizeof(bi=
oscfg_drv.password_data[id].new_password));
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  160
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  161      if (!ret)
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  162              ret =3D hp_set_at=
tribute(kobj->name, buf_cp);
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  163
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  164  exit_password:
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  165      /*
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  166       * Regardless of the resu=
lts both new and current passwords
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  167       * will be set to zero an=
d avoid security issues
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  168       */
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  169      clear_passwords(id);
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  170
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  171      kfree(buf_cp);
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  172      return ret ? ret : count;
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  173  }
> 1780f5eca27fb8 Jorge Lopez 2023-04-19  174
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
