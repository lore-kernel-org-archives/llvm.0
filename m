Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D185258
	for <llvm@lists.linux.dev>; Tue,  4 Jul 2023 09:06:25 +0000 (UTC)
Received: from [172.31.7.30] (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id AA81780ACB788;
	Tue,  4 Jul 2023 17:58:06 +0900 (JST)
Message-ID: <327e5e5a-5aec-316f-c4b1-b1dfcbb4c44c@lineo.co.jp>
Date: Tue, 4 Jul 2023 17:58:06 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
To: rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Yuta Hayama <hayama@lineo.co.jp>
Subject: Rust for linux build error due to Clang (bindgen) version
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I am a beginner in Rust and LLVM, so sorry if this is a rudimentary question.
I tried to build with CONFIG_RUST=y on the torvalds/linux kernel and got the
following error:

$ LANG=C make O=../build_6.5rc_pre LLVM=1

... (snip)

  RUSTC L rust/core.o
  EXPORTS rust/exports_core_generated.h
  RUSTC P rust/libmacros.so
  BINDGEN rust/bindings/bindings_generated.rs
thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at_/home/lineo/kernel/git_kernel_org/torvalds_linux/linux/include/linux/compiler_types_h_146_2)" is not a valid Ident', /home/lineo/.cargo/registry/src/github.com-1ecc6299db9ec823/proc-macro2-1.0.24/src/fallback.rs:693:9
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
make[2]: *** [/home/lineo/kernel/git.kernel.org/torvalds.linux/linux/rust/Makefile:310: rust/bindings/bindings_generated.rs] Error 1
make[2]: *** Deleting file 'rust/bindings/bindings_generated.rs'
make[1]: *** [/home/lineo/kernel/git.kernel.org/torvalds.linux/linux/Makefile:1293: prepare] Error 2
make[1]: Leaving directory '/home/lineo/kernel/git.kernel.org/torvalds.linux/build_6.5rc_pre'
make: *** [Makefile:226: __sub-make] Error 2

The versions of the tools and other items used are as follows:

kernel:  torvalds/linux a1257b5e3b7f8a21faf462d0118067fe31e71ffb
rustc:   1.68.2
bindgen: 0.56.0
clang:   17.0.0


This issue seems similar to what is described at the following URL.
https://stackoverflow.com/questions/76443280/rust-bindgen-causes-a-is-not-a-valid-ident-error-on-build

If this explanation is correct, then a Clang earlier than 16 or bindgen 0.62.0
or later is needed to avoid this issue. And I searched the ML and found that
a patch to fix it already exists.
https://lore.kernel.org/rust-for-linux/20230612194311.24826-1-aakashsensharma@gmail.com/

But I think this patch is still in the rust-dev branch of the rust-for-linux
tree and has not been merged into the mainline. The current mainline kernel
seems to have a issue where if the Clang is too new (16 or later), the build
fails even though `make rustavailable` passes.

Does this mean we need something like max-tool-version.sh? But that might be
a bit silly... If such "error occurs because the tool is too new" is repeated
in the future, I feel that it is necessary to check not only the lower limit of
the tool version, but also the upper limit.


Regards,

Yuta Hayama
