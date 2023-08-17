Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4621B7C3
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 22:21:39 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe8a1591c7so3140325e9.3
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 15:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692310897; x=1692915697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlC1DyO1L/CkYnJH3pV9o/a8i69bPsy5MMmKCAxtZVE=;
        b=ALiJHNz4mPCzthkFjF+Nspz0zaVeQeisvdjCj2BTOTpOOVHpiIbw7mYXlEjtIlKRv1
         mSbaNlI5sDA5ye2ELSxQUSJmArpN5QTljtbqSN28P1EbH++F33cszuZTX9S7UEI8OFXs
         itRuTbrdb1na34aKAtwAjQLfInnnYXpm492P2XrNOAGNvTmywgtigea6bR3UO0IsaROl
         rV7ob7VX9WwydiHQk//j0TKS8MVBmS84Zm33PQOn+crU9dXLKtJqa83HE9csSwLH+1la
         lQ/ANN0Vn5kBiU5Tjbi72Lscxum+zyl+Ed0UVwJC2VV8+lS6eUnyS/iiRhNu2kGowVLb
         b1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692310897; x=1692915697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlC1DyO1L/CkYnJH3pV9o/a8i69bPsy5MMmKCAxtZVE=;
        b=kxzeTooc3MP/T1HzgibXjKsvarl685/X9XiuP3s5BtQGM2R2etIVs5eMinEk342utZ
         w8ygD9X5ic/pNkNc/xHNNWvmtqLYZJqzMBfS7P7GCw07uE3m992fJrUAgIDSDtVP4pP0
         qd0qzkIdhnHBBnPvXb7SP87+zpvSjtxZpMrNOO1Gt23yE8eh6rwiO7JMmP4w1zI8n5vv
         6X2yUCBga0zrzCuI/661DTbUFHZ6Dy/ciCal2xotn8R1Bu4DDUtwb1oF0hfG6PH5ZhCx
         I9Vfr1G64gDIJq7wdszGeQaiCmTZ+Vt8wBWCaWY6mo9Yw+AtOgIykZgV7/Cp0T4eg+fa
         KGIw==
X-Gm-Message-State: AOJu0Yw6AQlxq4OuoQ2cgyXwzJdvFnIxXYdNO1bzDuVhi/h3280wQRZK
	TImKXVqgf09LXT+mRdaqNIFceqgKEutyBa7k/SnkOw==
X-Google-Smtp-Source: AGHT+IGyKVyzFlHPu1APSne/kAQ0QEBuErrnOlrhuK9mv4L0mr9yz7FOqgUGGn0MP1V61Pdl3a/Q0i2VSaIffGot+VI=
X-Received: by 2002:a7b:cc94:0:b0:3fe:374f:f7fd with SMTP id
 p20-20020a7bcc94000000b003fe374ff7fdmr728618wma.33.1692310897169; Thu, 17 Aug
 2023 15:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308171545.aknH9sjQ-lkp@intel.com>
In-Reply-To: <202308171545.aknH9sjQ-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Fri, 18 Aug 2023 00:21:00 +0200
Message-ID: <CANpmjNMFjm0QZqaTwAKdQrBi7qnLv2wAPOXz7frYch-9dUkArA@mail.gmail.com>
Subject: Re: [linux-next:master 9940/10848] thread 'main' panicked at
 '"ftrace_branch_data_union_(anonymous_at_include/linux/compiler_types_h_174_2)"
 is not a valid Ident', /opt/cross/rustc-1.68.2-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/proc-macro2-1.0.24/src/fallback.rs:693:9
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Kees Cook <keescook@chromium.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Aug 2023 at 09:13, kernel test robot <lkp@intel.com> wrote:
>
> Hi Marco,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   47762f08697484cf0c2f2904b8c52375ed26c8cb
> commit: 7a0fd5e1678505534573b3c14c6ff69ed8592596 [9940/10848] compiler_ty=
pes: Introduce the Clang __preserve_most function attribute
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/202=
30817/202308171545.aknH9sjQ-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171545=
.aknH9sjQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308171545.aknH9sjQ-lkp=
@intel.com/
>
> Note: the linux-next/master HEAD 47762f08697484cf0c2f2904b8c52375ed26c8cb=
 builds fine.
>       It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
> >> thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at_inc=
lude/linux/compiler_types_h_174_2)" is not a valid Ident', /opt/cross/rustc=
-1.68.2-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/proc-=
macro2-1.0.24/src/fallback.rs:693:9
>    stack backtrace:
>       0: rust_begin_unwind
>                 at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/librar=
y/std/src/panicking.rs:575:5
>       1: core::panicking::panic_fmt
>                 at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/librar=
y/core/src/panicking.rs:64:14
>       2: proc_macro2::fallback::Ident::_new
>       3: proc_macro2::Ident::new
>       4: bindgen::ir::context::BindgenContext::rust_ident
>       5: <bindgen::ir::comp::CompInfo as bindgen::codegen::CodeGenerator>=
::codegen
>       6: <bindgen::ir::ty::Type as bindgen::codegen::CodeGenerator>::code=
gen
>       7: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::co=
degen
>       8: <bindgen::ir::comp::CompInfo as bindgen::codegen::CodeGenerator>=
::codegen
>       9: <bindgen::ir::ty::Type as bindgen::codegen::CodeGenerator>::code=
gen
>      10: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::co=
degen
>      11: <bindgen::ir::module::Module as bindgen::codegen::CodeGenerator>=
::codegen
>      12: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::co=
degen
>      13: bindgen::ir::context::BindgenContext::gen
>      14: bindgen::Builder::generate
>      15: bindgen::main
>    note: Some details are omitted, run with `RUST_BACKTRACE=3Dfull` for a=
 verbose backtrace.
>    make[3]: *** [rust/Makefile:316: rust/uapi/uapi_generated.rs] Error 1
>    make[3]: *** Deleting file 'rust/uapi/uapi_generated.rs'
> >> thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at_inc=
lude/linux/compiler_types_h_174_2)" is

Looks like the commit added some lines before this union, and so the
line numbers have changed. AFAIK this is not a new issue:
https://github.com/Rust-for-Linux/linux/issues/1013

 not a valid Ident',
/opt/cross/rustc-1.68.2-bindgen-0.56.0/cargo/registry/src/github.com-1ecc62=
99db9ec823/proc-macro2-1.0.24/src/fallback.rs:693:9
>    stack backtrace:
>       0: rust_begin_unwind
>                 at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/librar=
y/std/src/panicking.rs:575:5
>       1: core::panicking::panic_fmt
>                 at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/librar=
y/core/src/panicking.rs:64:14
>       2: proc_macro2::fallback::Ident::_new
>       3: proc_macro2::Ident::new
>       4: bindgen::ir::context::BindgenContext::rust_ident
>       5: <bindgen::ir::comp::CompInfo as bindgen::codegen::CodeGenerator>=
::codegen
>       6: <bindgen::ir::ty::Type as bindgen::codegen::CodeGenerator>::code=
gen
>       7: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::co=
degen
>       8: <bindgen::ir::comp::CompInfo as bindgen::codegen::CodeGenerator>=
::codegen
>       9: <bindgen::ir::ty::Type as bindgen::codegen::CodeGenerator>::code=
gen
>      10: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::co=
degen
>      11: <bindgen::ir::module::Module as bindgen::codegen::CodeGenerator>=
::codegen
>      12: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::co=
degen
>      13: bindgen::ir::context::BindgenContext::gen
>      14: bindgen::Builder::generate
>      15: bindgen::main
>    note: Some details are omitted, run with `RUST_BACKTRACE=3Dfull` for a=
 verbose backtrace.
>    make[3]: *** [rust/Makefile:310: rust/bindings/bindings_generated.rs] =
Error 1
>    make[3]: *** Deleting file 'rust/bindings/bindings_generated.rs'
>    make[3]: Target 'rust/' not remade because of errors.
>    make[2]: *** [Makefile:1281: prepare] Error 2
>    make[1]: *** [Makefile:234: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:234: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
