Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8995D63AA
	for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 16:20:47 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id a5so3773341pfv.10
        for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 08:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+s3+R4BwN91gBepBEWrEY8Vvh5YNXMDaNjOtbjtONA=;
        b=PUD2yf2TNOz8iOQztqPJfdJ9ELRnWxBC9OXLVvc0IMpv2hMRfQrlK0ITtiAdKBU+hf
         vxUuKzjUsfHAY0amGyhDBmbYFLp9jyu+2l1wbj0hM2w1m4vZaEtz/nkmxs6lVQLolEi9
         H6TpF62UjRYsKAjxBWJFu0xALWrrCFLrdjELIMPIHZuuyQmv8eOw9r/khi+IPv5UC5Tw
         rVWB2YIsKZGJHrLiEZqJdsvwqFWegdKM7enGODXCgR/bQqsBw5TEeoEoLBtYDz44hYd1
         4Ee9OBaXLQXdoS4ianvnXhjRuGc6E6k7hOS4SKR1ulB57R9R4a8XTclSEFIQ007wNoUP
         nPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+s3+R4BwN91gBepBEWrEY8Vvh5YNXMDaNjOtbjtONA=;
        b=xIkYR+HK8mbA2EyOBQulWn1A9fn43RLwO7FiU8C/Eqg7DRMOqkF820qsq3N9oCeqPr
         FkX8wcPa27FdstBocpVXvH/OGT9ZM29jxM3TGCUqp9og8Y4WKxVcRYz8BQnLm0tVUdwH
         JrYNLC8S0FCT4jK6d8JXYcT8d4gRs8jexq+aRVt8piuDmfMBh2UPFMDHiVUnvO1h56Bb
         ZRB86Lb7EK1W4g9N9Xf+/x+wzodvFlGxlD2h4AWe8Kj0g2zKHiixkYtoWaqH1vYATjsi
         lV8e2SOEupcBjUyFgzqoMk+Tk2pwdOgY6SDaAk8yuXYalmYdfbioz1+wEBfx/fltv8NU
         DKpA==
X-Gm-Message-State: AO0yUKVMTAbDxg83iunvPKP3BhoKgdWfisltGjH7J1dtxgiwljfC+rCV
	WPgwH8r8pqAAyjnx9gefaVc=
X-Google-Smtp-Source: AK7set99SI3pKlRjrZCRkEnyIZEEUot5w8CzY221yQ6oODsw8IKivq7tbJBLTxpHBLVzJB9Y5m+i2g==
X-Received: by 2002:a62:1d91:0:b0:5a8:718c:5ee9 with SMTP id d139-20020a621d91000000b005a8718c5ee9mr1786799pfd.25.1676046046923;
        Fri, 10 Feb 2023 08:20:46 -0800 (PST)
Received: from localhost ([124.248.219.206])
        by smtp.gmail.com with ESMTPSA id i1-20020aa78d81000000b0058ba2ebee1bsm3433711pfr.213.2023.02.10.08.20.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 08:20:46 -0800 (PST)
Date: Fri, 10 Feb 2023 08:20:33 -0800
From: Dan Li <ashimida.1990@gmail.com>
To: Peter Collingbourne <pcc@google.com>
Cc: gcc-patches@gcc.gnu.org, Richard Sandiford <richard.sandiford@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Marco Elver <elver@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Song Liu <song@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uros Bizjak <ubizjak@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>, Borislav Petkov <bp@suse.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Aaron Tomlin <atomlin@redhat.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Changbin Du <changbin.du@intel.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [RFC/RFT 0/3] Add compiler support for Control Flow Integrity
Message-ID: <20230210162033.tb5b6cd3j3vxr6vv@ubuntu>
References: <20221219055431.22596-1-ashimida.1990@gmail.com>
 <CAMn1gO6hwaSDCqigwoH981ffVbU8OvgJhrGh997kGseCSbpAJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO6hwaSDCqigwoH981ffVbU8OvgJhrGh997kGseCSbpAJA@mail.gmail.com>
User-Agent: NeoMutt/20171215

On 02/08, Peter Collingbourne wrote:
> On Sun, Dec 18, 2022 at 10:06 PM Dan Li <ashimida.1990@gmail.com> wrote:
> >
> > This series of patches is mainly used to support the control flow
> > integrity protection of the linux kernel [1], which is similar to
> > -fsanitize=kcfi in clang 16.0 [2,3].
> >
> > I hope that this feature will also support user-mode CFI in the
> > future (at least for developers who can recompile the runtime),
> > so I use -fsanitize=cfi as a compilation option here.
> 
> Please don't. The various CFI-related build flags are confusing enough
> without also having this inconsistency between Clang and GCC.

Hi Peter,

Got it, as discussed before[1], in the next version I will use the same
compile option.

[1]. https://patchwork.kernel.org/project/linux-arm-kernel/patch/20221219061758.23321-1-ashimida.1990@gmail.com/

Thanks,
Dan.

> 
> Peter
