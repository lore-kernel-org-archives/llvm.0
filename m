Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0157474;
	Fri, 20 Jan 2023 21:41:51 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-4ff07dae50dso45727527b3.2;
        Fri, 20 Jan 2023 13:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mOYAowSd7KdH13kScqSab02fekUH0oBpoj4QfPYHtOU=;
        b=obSzTawbgOHAY/jNsW686SIXhdTy7YEp1CcM6JVTU5MzND0BY3RSw+ILQM+ujtNh7Z
         vQHy7uDMXafbLGj5PcXvi56BlXkY3iqNEc2Qu2h6JgGWUnqyWiaWVkmALsuXIl6yB7zG
         BDf6s6DuczALhA01QXnNOsjE9Lf4RdUPeOdVvomqTcNwoH3rLMxKy02CRuGwWZZgxwe6
         ejETJdyb68hgpzfWWKZdBqDXZSlxTqz8MS7BGA8XHSM1y6CaJX0hSpInuX074spj9uD/
         ckfzVi50cNTjYxBCQfWCzGY+eHa2LNVZz69L4Iq4eTg0T+NxGP+WSQ/SqEBUt66GWVSZ
         Gv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOYAowSd7KdH13kScqSab02fekUH0oBpoj4QfPYHtOU=;
        b=lADs5lwDMh4BnT4rL772n3rNPeOF9X/JMAyYt2KK4M5WXUd6KUlCnpOgyfE8RBkLJt
         yxnio6m44ErC9SQreIvX6Xf5iiolO9Ep8dxoK1L7LVY41tT/wf37QX0YJgOwadYbD5e+
         bm8/Fm/1zPdSyiKV0gYlGy+BVL9CtUmarkBNbHnqOI4jjA5Rr4Pt6vPEiydqd6eq8EEY
         esfoV2jtqm0prfsNSJLY//CGV5582314GDhSgT8CHufFXWx/WFCcPQYXcu6UyCsWSTgx
         oIQhMBR2GPnkzlBAvB+iAAd8lzb5/uL2NI6cQWXGrmnWw1KoQFnQMFccJDxreBAqvCOW
         Ox1Q==
X-Gm-Message-State: AFqh2kqarnsmJFvQ3dz8RmbuZN36rMAva3/UqeSpP8BdLAdETNkxgHhG
	chXeCx2up+1k2HgiQI7wgoD4iRZIkjXp41Po3/8=
X-Google-Smtp-Source: AMrXdXs5hoII1AVkYzBjAEblS9wLMone8oD7aZCaO6dCFaR1LTvUeUtEEe//6jWbZtAjFcCMdmJYpPKSwNduchhu6wc=
X-Received: by 2002:a81:57d6:0:b0:501:2887:8c8e with SMTP id
 l205-20020a8157d6000000b0050128878c8emr382936ywb.256.1674250910832; Fri, 20
 Jan 2023 13:41:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301201612.50oSpQHu-lkp@intel.com>
In-Reply-To: <202301201612.50oSpQHu-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Jan 2023 22:41:39 +0100
Message-ID: <CANiq72=UD2Wnx4WgJSeKyL6WGytadG9p0Dt8YHL2cD-0zhsc4Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: types: implement `ForeignOwnable` for the unit type
To: kernel test robot <lkp@intel.com>, Yujie Liu <yujie.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi kernel test robot, Yujie,

On Fri, Jan 20, 2023 at 9:15 AM kernel test robot <lkp@intel.com> wrote:
>
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230120/202301201612.50oSpQHu-lkp@intel.com/config)

Could you please disable `CONFIG_RETPOLINE` and
`CONFIG_X86_KERNEL_IBT` for the Rust config? (e.g. like in KernelCI
https://github.com/kernelci/kernelci-core/blob/main/config/core/build-configs.yaml#L410)

We are discussing whether to add a `depends on !` or other approaches
on the kernel side, which may make that redundant, but meanwhile it
would be great if you could update the config.

Thanks!

Cheers,
Miguel
