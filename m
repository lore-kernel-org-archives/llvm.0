Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D053B5
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 19:52:25 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id l22so1904896edj.5
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 12:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=emc9s70uHNUzyZPgEpvfqwaCXJYyWsYo5CNPx2MSFOQ=;
        b=QHyWa1mMeYWy9atrnKuccLRFrfB9R37bQHOuKlNfphLvr556kSpo6npqk5ZDfRXDmu
         2I0cDwPCOOOJ6Mz6mr8zKuJWBo546WecQvMZbh21VPNPXw9kl0npFzvAKL1jAoiYACUc
         e9ARAL9Uuv53Y9+uoDKte0XONk8JUQfKLgybCWCRYG8M2BLR62V4P7aZOAXxHmMYDcGN
         365sQuUNJq9bRRZLLogNzrwKne7Op6aNDOWofaT3iKwvkg1dB5PglAGD9USSZDQSJCvL
         C/298tflxNj/Iu2Eb4qAz7Ttbq90gT21fuyJPlV85InFHC3xUmA42DbGZDXnZGAVaYYS
         7YeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=emc9s70uHNUzyZPgEpvfqwaCXJYyWsYo5CNPx2MSFOQ=;
        b=MFEHHeiCZStzLOtOmL3UHyfJNSEwIfB9uiEZqgmcgzUv6Zd0+eDfkOsCSHGRp0rv0Y
         MRIHc+z9qCboVLRZg0/CXW/3g5FS65H7Oy1nys1XyF/BYAdOVyZr+bXD/DSxWM3RQ2yW
         OjxIjl3xzm10uqf40DugL+t4XomwLBCPTTGe/DjoIsf0dAS2jlpq0ALllAA9l3A0PZOn
         0prYbcLoN4QVtW6FaUcDeZsXHkZXMoW0SfEoc/fbwNPPvrXH8fuqpDfJmnUqwMSl7Onc
         q2ACjBUumELk2B922PAako6vSRcRcsyAd/a1FVhxah4vDsPHNFSuxfqip1ucD5oeIp1W
         kayw==
X-Gm-Message-State: ACrzQf2nj/G6xPEdGKxj2EIsd0xpEJWn2hDIzeG6PPIvuOv9z8z4O+ST
	hwaLsJ75DVip7ewjERby9ySdsrvU58RUOY5lGmo=
X-Google-Smtp-Source: AMsMyM6jNucFDbnsJD9zn/owio/7vL+2hrmBdiQs5pIwPSz48lyuEa/jQscRs0puqEdi9ROH6IWBaSkSCbdELiTm5xQ=
X-Received: by 2002:a05:6402:34d0:b0:458:a4a:6dd0 with SMTP id
 w16-20020a05640234d000b004580a4a6dd0mr4789329edc.297.1664481143951; Thu, 29
 Sep 2022 12:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220927085702.10026-1-zhoujie@nfschina.com> <202209292358.oyaafCLq-lkp@intel.com>
In-Reply-To: <202209292358.oyaafCLq-lkp@intel.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 29 Sep 2022 21:52:12 +0200
Message-ID: <CAOi1vP_GQ7CwQ1W0wbA_BQxHHgZBTCSSSd_g4_-czoHkKEVp7A@mail.gmail.com>
Subject: Re: [PATCH] fs/ceph:Modify the return value to void
To: kernel test robot <lkp@intel.com>
Cc: Zhou jie <zhoujie@nfschina.com>, jlayton@kernel.org, xiubli@redhat.com, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 5:19 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Zhou,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on ceph-client/for-linus]
> [also build test ERROR on linus/master v6.0-rc7 next-20220928]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Zhou-jie/fs-ceph-Modify-the-return-value-to-void/20220927-165857
> base:   https://github.com/ceph/ceph-client.git for-linus
> config: hexagon-randconfig-r041-20220926
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/6c7163052ce6f51c217c650bc5592b7ef50b2280
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Zhou-jie/fs-ceph-Modify-the-return-value-to-void/20220927-165857
>         git checkout 6c7163052ce6f51c217c650bc5592b7ef50b2280
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/ceph/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> fs/ceph/debugfs.c:281:38: error: incompatible function pointer types passing 'void (struct inode *, struct ceph_cap *, void *)' to parameter of type 'int (*)(struct inode *, struct ceph_cap *, void *)' [-Wincompatible-function-pointer-types]
>                    ceph_iterate_session_caps(session, caps_show_cb, s);
>                                                       ^~~~~~~~~~~~
>    fs/ceph/mds_client.h:540:16: note: passing argument to parameter 'cb' here
>                                         int (*cb)(struct inode *,
>                                               ^
> >> fs/ceph/debugfs.c:349:1: error: incompatible function pointer types passing 'void (struct seq_file *, void *)' to parameter of type 'int (*)(struct seq_file *, void *)' [-Wincompatible-function-pointer-types]
>    DEFINE_SHOW_ATTRIBUTE(mdsmap);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/seq_file.h:199:27: note: expanded from macro 'DEFINE_SHOW_ATTRIBUTE'
>            return single_open(file, __name ## _show, inode->i_private);    \
>                                     ^~~~~~~~~~~~~~~
>    <scratch space>:79:1: note: expanded from here
>    mdsmap_show
>    ^~~~~~~~~~~
>    include/linux/seq_file.h:166:38: note: passing argument to parameter here
>    int single_open(struct file *, int (*)(struct seq_file *, void *), void *);
>                                         ^
>    fs/ceph/debugfs.c:350:1: error: incompatible function pointer types passing 'void (struct seq_file *, void *)' to parameter of type 'int (*)(struct seq_file *, void *)' [-Wincompatible-function-pointer-types]

Hi Zhou,

As you can see from the above output, the signatures of these
functions are dictated by debugfs infrastructure.  Even though
we happen to return 0 in all cases, changing the return type to
void is wrong.

Thanks,

                Ilya
