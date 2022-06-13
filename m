Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C306D1396
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 15:34:29 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 20so9454648lfz.8
        for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aUVrD5sZvhy5pi929qRyfNG0F+b3Zc/EW53D0+fY2uU=;
        b=cLxqLvD7xD6X5YtMkj/pR8TW/akQrGK2QTo+Z1G9xksqo9jEnqRMdQ8SY9AYMmckFC
         HJ5AvqMRnxQcVPbXzVQ3v3A/WZS/ADypsHxDbf4m1r/LAEVoUoP8iO4W8YpKtVoM9tfa
         Okp/StB9ZLXVpPjEduqgrhG+Qpnh9Ixp/7Abm3G1wPEAB1OdV3aLNRUnPYP5LV1vUti6
         aLDebyyBICArtB06SLl29jLYmJSNf8wcnasQ3r2C+vAGJ9q7aAg8AJCkt1g9mOwtHr+Y
         o4ETYLGJJTtlRm86g3IkVOBdTxr3UOSvG0Ify/sX7MvZKfSy6eM21P9ehvhrxhCk6Je4
         a64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aUVrD5sZvhy5pi929qRyfNG0F+b3Zc/EW53D0+fY2uU=;
        b=u4BGdePdgEWGttm/GdINotg3WQODJR72ke8LOcMT5Vr6tf1qVMEA71FjWzWDK22RdH
         nmsreSw3rTUbLMColucqNh6fnPn+l/hiy1R5wVs4KUKELaesPGXv0QPdaicOJwnxzz1q
         tLPec5TRPjr5lH0rFjDctlNcJ+sddCapnAVBn8GwYlKReXC3pb5LGvJHzeh73jXThBG6
         kIhdKby76Yabp7DMrvnNy4Kv7zdPoKflnJAco2PGLfgqia1x2fc3bg3B3sARBfEqjNya
         HAoItcGD8rIaWWBrSCjNAJF4IZNQk43MH7KP0J4X2uefPC3TXbuX6SQ7NbOP10FGvobm
         P6iQ==
X-Gm-Message-State: AJIora/eOgqJobRQs3B/aIAuOOlMn/lMC1HUHJfAC5UySqoef9l4EzqG
	9v8gXcc2aTFp9iqp2kTHS8Pt71FhFOmMEDaqBPU5kA==
X-Google-Smtp-Source: AGRyM1sivSKtZ2HgEKJkMKPlx6MiLhcJIawAYX5/5JBtlgrK15mqjiclGttnbibu0eAnQ9GvJo6wuuGvSpufL7YXxw0=
X-Received: by 2002:a05:6512:3c8b:b0:479:324c:dfd9 with SMTP id
 h11-20020a0565123c8b00b00479324cdfd9mr258533lfv.644.1655134467556; Mon, 13
 Jun 2022 08:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202206131853.x4KJwC5Q-lkp@intel.com>
In-Reply-To: <202206131853.x4KJwC5Q-lkp@intel.com>
From: Peter Gonda <pgonda@google.com>
Date: Mon, 13 Jun 2022 09:34:15 -0600
Message-ID: <CAMkAt6oxQqRCMt54ZRsx_TGd2banbwAy4Hq+A6GHokpMsoo-AA@mail.gmail.com>
Subject: Re: arch/x86/kvm/svm/sev.c:1605:30: warning: parameter 'role' set but
 not used
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	LKML <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 13, 2022 at 5:03 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Peter,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
> commit: 0c2c7c069285374fc8feacddc0498f8ab7627117 KVM: SEV: Mark nested locking of vcpu->lock
> date:   5 weeks ago
> config: x86_64-buildonly-randconfig-r005-20220613 (https://download.01.org/0day-ci/archive/20220613/202206131853.x4KJwC5Q-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c2c7c069285374fc8feacddc0498f8ab7627117
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 0c2c7c069285374fc8feacddc0498f8ab7627117
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/ drivers/media/platform/qcom/camss/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> arch/x86/kvm/svm/sev.c:1605:30: warning: parameter 'role' set but not used [-Wunused-but-set-parameter]
>                                            enum sev_migration_role role)
>                                                                    ^
>    1 warning generated.
>
>
> vim +/role +1605 arch/x86/kvm/svm/sev.c
>
>   1603
>   1604  static int sev_lock_vcpus_for_migration(struct kvm *kvm,
> > 1605                                          enum sev_migration_role role)
>   1606  {
>   1607          struct kvm_vcpu *vcpu;
>   1608          unsigned long i, j;
>   1609          bool first = true;
>   1610
>   1611          kvm_for_each_vcpu(i, vcpu, kvm) {
>   1612                  if (mutex_lock_killable_nested(&vcpu->mutex, role))
>   1613                          goto out_unlock;
>   1614
>

I am confused about this warning. |role| is used on this line above.
Is this because CONFIG_DEBUG_LOCK_ALLOC the subclass argument is
dropped in the macro?
