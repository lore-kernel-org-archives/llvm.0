Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28A31C32
	for <llvm@lists.linux.dev>; Sat,  7 Jan 2023 15:42:18 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id p123so2195874pfb.8
        for <llvm@lists.linux.dev>; Sat, 07 Jan 2023 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xDSCMl1byV6r8CizXSU340HcVITDFX3ysn4+0ZvaY4=;
        b=TNWw3UNm5egls2TgN5h1Ray/CeJYacXRE5VvHj5EBCIDbShpoHMXcg/CdGYkkUB4Wg
         XFDo8Z7EyaAmDv+1hTmeIrPlgAWAb0Kr7iIjKimoOH43XnVytB2LObGWtdMsMmC2t7T7
         3GHxn24IttXoZThaVeAuklaoGEpGV12+uQlxosVbSOJsEEWcwK1VxkOPRSZCd1XgF5iI
         6a8n6zXv26MZdzIJe1jEet6ATzAf+eRP/0droi6ns2ZlwJBUFJSbpN3ZgHVpTCTSBgna
         upO2eBw994cGyLlKX6C2DeRIUIANfl5xh2sipF+4p+peodXSBVdv4l66V/HRyAJV3ooh
         L8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xDSCMl1byV6r8CizXSU340HcVITDFX3ysn4+0ZvaY4=;
        b=OYY2aihetX/tY6QsfP15BJAzUkdxLpK8lc3+7RyqtSX3EO+bmM0zynj3W8KE/ySKxl
         SQOP4vUo6s7CJmvSyKF3qab8ykGPr1A2z0RusvA8kLfF2VT2NWp0eJMl4JhjSL5uoqSm
         pNvTM8zYt8szqVy4yNGNIoD9DWiUnOYm5QI8/Q4sgrKLlQktni2ByjpHXQQra0h0VpgS
         4s+7xWXUsDqCs9nRkjiUWBfqRksEFmgG3L8a8wdTjQzFw+7ry8M3Nm47NTPgZSZFGKSK
         HyS5qSTHQb2IgPS/ERzm5+bvHna0Pgg9J14T+X1IE4jUZeSb4HxGeMEovJqSwT0+gCyd
         A9Dw==
X-Gm-Message-State: AFqh2kpRkYcOQPFoimCyeLPhAWhkqLPShObbRRFtj2wL0pymbA9hGR5Y
	XuSrFU9amCaiQaUgLo85PU0=
X-Google-Smtp-Source: AMrXdXvE5OGLzHXfqQC90eD/mJS2cy4fM2WVoP4U6+pXa936fN643zge3kXFDrnpKY640ANna1bIiA==
X-Received: by 2002:a62:b50c:0:b0:587:3153:6080 with SMTP id y12-20020a62b50c000000b0058731536080mr669851pfe.31.1673106138167;
        Sat, 07 Jan 2023 07:42:18 -0800 (PST)
Received: from localhost ([124.248.219.206])
        by smtp.gmail.com with ESMTPSA id h2-20020aa79f42000000b00575d1ba0ecfsm2966907pfr.133.2023.01.07.07.42.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 07:42:17 -0800 (PST)
Date: Sat, 7 Jan 2023 07:42:13 -0800
From: Dan Li <ashimida.1990@gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Qing Zhao <qing.zhao@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
	llvm@lists.linux.dev
Subject: Re: [RFC/RFT] CFI: Add support for gcc CFI in aarch64
Message-ID: <20230107154213.ocyghxd2k66gbvv6@ubuntu>
References: <20221219061758.23321-1-ashimida.1990@gmail.com>
 <Y6A/k7/KrCCDuux6@hirez.programming.kicks-ass.net>
 <20221219132731.6ng4sz2nv6ujvu7i@ubuntu>
 <202301061929.6881F6CD40@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301061929.6881F6CD40@keescook>
User-Agent: NeoMutt/20171215

Hi Kees,

On 01/06, Kees Cook wrote:
> On Mon, Dec 19, 2022 at 05:32:04AM -0800, Dan Li wrote:
> > Hi Peter,
> Hi!
> 
> First of all, thank you thank you for working on this in GCC. This will
> make a big difference for folks that don't have the option to build with
> Clang to gain CFI coverage.
> 
> As for the implementation details, the core issue is really that this
> type of CFI is specifically designed for the Linux kernel, and it took a
> rather long time to figure out all the specifics needed (down to the
> byte counts and instruction layouts). GCC's version will ultimately need
> to exactly match the Clang output, or Linux is unlikely to support it.
> 
> We're already on our second CFI -- the original Clang CFI was just too
> clunky for long-term use in Linux, so unless we're going to improve on
> the latest Clang KCFI implementation in some way, it's better to stick
> to exactly byte-for-byte identical results. The KCFI support in Linux
> depends on the arm64 and x86_64 runtimes for catching the traps, and the
> post-processing done (on x86_64) with objtool that prepares the kernel
> for IBT use, and converts to the optional FineIBT CFI mechanism. With
> all those moving parts, there needs to be a very compelling reason to
> have GCC KCFI implementation differ from Clang's.
> 
> Hopefully that context helps a little. I'm excited to try out future
> versions!

Thanks for the context, it makes sense and helped me a lot. :)

In the next version I'll make the gcc implementation consistent with clang.

Thanks,
Dan.

> 
> -Kees
> 
> -- 
> Kees Cook
