Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113D9610A;
	Sun, 29 Oct 2023 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bm0ljIv2"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-509109104e2so1052326e87.3;
        Sat, 28 Oct 2023 23:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698562602; x=1699167402; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFy+RcQKDTr5alLvXeX4agQqROH2cD25D/5nFBfzPhg=;
        b=bm0ljIv26gCoXw7GHl4FVjvcWJE19mOCfJkq/9YtS3hey52bbwjNc8kZDYCdW6vmWN
         RFqjhuRRTX0Ib3/pekbMf+prjD26/HGxS1Okw28J2y9bZFVIJRh5A08PKXh43De3f7SI
         oGYSQL7PBK7zXxpfkEyh9BUei+dpD/8j3HkIKj57QX4SY4UmQPhyrwJUduN3Q4a71Go7
         WQN0VBrgaoVJsx/KQEijX1yulxa2a1zYB03epWyHbPtIhIC+pyDG1ARnOtRodJmfXf/1
         rtu7ekL3Z+IHUNtgpu0K553bMjvOwkxOjKUM3hrKIy2EAsojhjNaVWfKiaaqDjOzz6DV
         Kpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698562602; x=1699167402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFy+RcQKDTr5alLvXeX4agQqROH2cD25D/5nFBfzPhg=;
        b=I9NyeLjlhmD4Sdo684YFE50dHfWeOPbRTHLTlLFWSxhv1Yf0JyjBaFWdVOMD1F5myN
         UBYCn67+DHnXOvSxqtW0ACzfmslbK+YuUol6Ep4LQ+cyEEjfsDYBgq5sDaV9E0SC30Dh
         f0ugNDtrkBBGXU1ZBOeoFrq42eYdz8TPEfHSzxdwH56/kLz4AjZCtZaA6xMp4Uq4n2qx
         Qr7ZB8WvDmbYwTv08khCzoHdUvp8FSH3fxxw8VO9AT7FJx3OePeWktrmnWZ0cYPhIbfI
         qEu1H9lLXZ8ETx70xI5KDdYST+R7pYdHTFSAal0wT4O+yWDqRRBpIItyfTPLQAOF4cQX
         RRsA==
X-Gm-Message-State: AOJu0YwzI/iQ1s8VgrHc0cTvZ6MWiBX8oQmsAfF8GA8YkxopeKvPLkVX
	JhWyAUMrrXGabjO1NITRzYOAenv6jNLUnTC+9w==
X-Google-Smtp-Source: AGHT+IFVlRp0lfPgmcGpvpQ+VxM6tmfRLa2oMOe+jrJ/VXYD16A92VETn9a3ezMosmaB6pYNxaHV1+wDiwSesV19a+E=
X-Received: by 2002:ac2:5226:0:b0:507:9a00:c169 with SMTP id
 i6-20020ac25226000000b005079a00c169mr4754464lfl.5.1698562601649; Sat, 28 Oct
 2023 23:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231026160100.195099-6-brgerst@gmail.com> <202310290927.2MuJJdu9-lkp@intel.com>
In-Reply-To: <202310290927.2MuJJdu9-lkp@intel.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Sun, 29 Oct 2023 02:56:30 -0400
Message-ID: <CAMzpN2iUrfnuGQ9eFTr=NTeC6KSUPC37Qji5_g5MWejmXnXO3A@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] x86/stackprotector/64: Convert stack protector
 to normal percpu variable
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 28, 2023 at 9:26=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Brian,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/master]
> [also build test ERROR on next-20231027]
> [cannot apply to tip/x86/core dennis-percpu/for-next linus/master tip/aut=
o-latest v6.6-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Gerst/x86-st=
ackprotector-32-Remove-stack-protector-test-script/20231027-000533
> base:   tip/master
> patch link:    https://lore.kernel.org/r/20231026160100.195099-6-brgerst%=
40gmail.com
> patch subject: [PATCH v2 05/11] x86/stackprotector/64: Convert stack prot=
ector to normal percpu variable
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/202=
31029/202310290927.2MuJJdu9-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231029/202310290927.2MuJJdu9-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310290927.2MuJJdu9-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> Unsupported relocation type: unknown type rel type name (42)

Clang is generating a new relocation type (R_X86_64_REX_GOTPCRELX)
that the relocs tool doesn't know about.  This is supposed to allow
        movq    __stack_chk_guard@GOTPCREL(%rip), %rax
        movq    %gs:(%rax), %rax
to be relaxed to
        leaq    __stack_chk_guard(%rip), %rax
        movq    %gs:(%rax), %rax

But why is clang doing this instead of what GCC does?
        movq    %gs:__stack_chk_guard(%rip), %rax

Brian Gerst
