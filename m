Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CD77465
	for <llvm@lists.linux.dev>; Mon,  1 May 2023 19:55:18 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54fb6ac1e44so40616177b3.1
        for <llvm@lists.linux.dev>; Mon, 01 May 2023 12:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682970917; x=1685562917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A6/Qwr73DpjqVyRdRECBbxXjLLTahq/uJGnivC6mAq8=;
        b=nOGV79JHEufvcYn2AKhdk79/ViXSWov22Cy33zWA1Gtst+eCDvoVa3OWWz5HNIcCII
         UZejZi5Uegh9PTt5hwbCSATYVQ0siN0O+UgoBQWNisA50H9K9bZk9Wrc9Z0OQeeEfA/+
         +yThvmo2Fno7BKwBTkUAF3LbTzoNv7/LwN0wU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682970917; x=1685562917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6/Qwr73DpjqVyRdRECBbxXjLLTahq/uJGnivC6mAq8=;
        b=LDv4gswVCR6OOs6a5Pk1f4d4b9fsbaohgaFmY3cPeMARSgD8AA8pOPF79VNhdR1jKb
         OAb6d4CgwoN4BSfGndQkusJAL6JhJWh+P1IS//UhHPhFpILaoj8rUzjFEx4Wa+50aMnA
         c+ecDOeE7gb+m1TpZ5hA9d1EO1Kc/qkIpnIsnZmn/WOpoNkreR7oavTNkHuXI4kAcp09
         hgmXV5cFz8aGt7FkhV92rHKkR/atY2w4UgmxxkKBeZABEaBFjVo/d3g2Y66CRAO8JGST
         YF+hTsKiARNqbZmeVcoIB8moMAgqS5vSFUkdth/rUI97XCCGanasEu2kjBcI1jsw0mjQ
         OTTw==
X-Gm-Message-State: AC+VfDzL7BtqZY2nmgOFSN68gexg5PJxllPQogn3jeQnuEIEJvTMcyvL
	IR2aZaKsrV446xO5B4DNKFivpiAmNBKit0F1blQPmQ==
X-Google-Smtp-Source: ACHHUZ6a3YHHWr1rqzp19yy1agG5MoEgQpVz+KtGGQ8piyMRTygF756+G9a2uVZVYDMTo5esyKxzLQ==
X-Received: by 2002:a0d:dd03:0:b0:559:deed:f363 with SMTP id g3-20020a0ddd03000000b00559deedf363mr8862607ywe.2.1682970917260;
        Mon, 01 May 2023 12:55:17 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id i125-20020a255483000000b00b9a65b05384sm2854494ybb.15.2023.05.01.12.55.16
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 12:55:16 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b9a6869dd3cso4512422276.2
        for <llvm@lists.linux.dev>; Mon, 01 May 2023 12:55:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:a28a:b0:e6:f7e8:1e4d with SMTP id
 a10-20020a056a20a28a00b000e6f7e81e4dmr13625249pzl.33.1682970895325; Mon, 01
 May 2023 12:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
 <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org> <20230501-cottage-overjoyed-1aeb9d72d309@spud>
In-Reply-To: <20230501-cottage-overjoyed-1aeb9d72d309@spud>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 1 May 2023 21:54:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCufbm80g4AqukpiuER17OXhD-yRNmTZRz7s_x-Xi9BDCw@mail.gmail.com>
Message-ID: <CANiDSCufbm80g4AqukpiuER17OXhD-yRNmTZRz7s_x-Xi9BDCw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
To: Conor Dooley <conor@kernel.org>
Cc: Eric Biederman <ebiederm@xmission.com>, Philipp Rudo <prudo@linux.vnet.ibm.com>, 
	Dave Young <dyoung@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Baoquan He <bhe@redhat.com>, 
	Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ross Zwisler <zwisler@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor

On Mon, 1 May 2023 at 19:41, Conor Dooley <conor@kernel.org> wrote:
>
> Hey Ricardo,
>
> On Mon, May 01, 2023 at 02:38:22PM +0200, Ricardo Ribalda wrote:
> > If PGO is enabled, the purgatory ends up with multiple .text sections.
> > This is not supported by kexec and crashes the system.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  arch/riscv/purgatory/Makefile | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> > index 5730797a6b40..cf3a44121a90 100644
> > --- a/arch/riscv/purgatory/Makefile
> > +++ b/arch/riscv/purgatory/Makefile
> > @@ -35,6 +35,11 @@ CFLAGS_sha256.o := -D__DISABLE_EXPORTS
> >  CFLAGS_string.o := -D__DISABLE_EXPORTS
> >  CFLAGS_ctype.o := -D__DISABLE_EXPORTS
> >
> > +# When profile optimization is enabled, llvm emits two different overlapping
> > +# text sections, which is not supported by kexec. Remove profile optimization
> > +# flags.
> > +KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
>
> With the caveat of not being au fait with the workings of either PGO or
> of purgatory, how come you modify KBUILD_CFLAGS here rather than the
> purgatory specific PURGATORY_CFLAGS that are used later in the file?

Definitely, not a Makefile expert here, but when I tried this:

@@ -35,6 +40,7 @@ PURGATORY_CFLAGS_REMOVE := -mcmodel=kernel
 PURGATORY_CFLAGS := -mcmodel=large -ffreestanding
-fno-zero-initialized-in-bss -g0
 PURGATORY_CFLAGS += $(DISABLE_STACKLEAK_PLUGIN) -DDISABLE_BRANCH_PROFILING
 PURGATORY_CFLAGS += -fno-stack-protector
+PURGATORY_CFLAGS := $(filter-out -fprofile-sample-use=%
-fprofile-use=%,$(KBUILD_CFLAGS))

It did not work.

Fixes: bde971a83bbf ("KVM: arm64: nvhe: Fix build with profile optimization")

does this approach, so this is what I tried and worked.

Thanks!
>
> Cheers,
> Conor.
>
> > +
> >  # When linking purgatory.ro with -r unresolved symbols are not checked,
> >  # also link a purgatory.chk binary without -r to check for unresolved symbols.
> >  PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib
> >
> > --
> > 2.40.1.495.gc816e09b53d-goog
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Ricardo Ribalda
