Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E8EC5
	for <llvm@lists.linux.dev>; Wed,  5 Apr 2023 11:48:50 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso36951127pjb.3
        for <llvm@lists.linux.dev>; Wed, 05 Apr 2023 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680695330;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTsmdblHPYajB+3qczYhTQWyrb6fly5Dk4QPH+tzONA=;
        b=gB7rd4W7Gl5XVMiDYxgFsOVckNNSwU82k/ZjQkQT/QUsholqIcv8o2EFrO2eChuzqJ
         /E1Nom6E9OqVZjG1oCeeXIpyYlMTX83oUbH+vrAMBiljmxwpY1NMErmGtwM/4kR1FfAf
         hbb9rumIaGK3o0a+t85nZ9QLJzQAsq6NOQbKus/TppZZYT7cDoYxhqijELG68+PKgXwa
         AW3rV864e3GUeXTY8t245RZh1MUTn2PaCC0EPwp9Ewm661bd+y79Rq+2tRDeDmVVuB2D
         aodRwaRPoLayJHjaBUnU95IZjyqTIp4kVX3Wtfm5NE0FJUdRCcMjEXw7XvCpkJDPa2te
         dhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680695330;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTsmdblHPYajB+3qczYhTQWyrb6fly5Dk4QPH+tzONA=;
        b=opZ1xuJw57ktzzyR7XTI8+nJnlMFJuyQ3q8zBUv6aZLcNcb7FWVZ31WS2qrin7rwYS
         E6KHgLUVblmj4ALzNwts1L+2DNmxnCjxTvDkUvnFH4fx63tLSVaEL2ZypmGUNv2y+ofJ
         UdLvyxoveaVdfRAndlO+bcSX3sVmz59zOSf++7Z0KLanZ4O9VCC48OyR5fsGC7wVHNbg
         heqGrL4pNSEpt5FXj5Ir9A3bJyxXpYAIFl+lMghzn/TpasoO+FTe2BFMiEQ4tTckKDjo
         G9J2HrDYNn9kbACQOc7xQzYovBMfTHESiWCQ7Nodb8wCzW9Io49kaEzYZvxl1nR+aZcD
         bNsA==
X-Gm-Message-State: AAQBX9fHP/NpAItSEch1EhHb76n63mVPjGQsd1l62tLFfpB7N7DXlWcc
	38N/1quExyYe2IooyqmyFMc=
X-Google-Smtp-Source: AKy350bcdEP3B4h5AyJ/RqXHOvANV432V+AKzzoYSsJ3l0S4OxqL2NCwOgdI7rMZqe9lklSr4+t97g==
X-Received: by 2002:a17:90b:1e49:b0:23f:ef7:7897 with SMTP id pi9-20020a17090b1e4900b0023f0ef77897mr6177640pjb.49.1680695330032;
        Wed, 05 Apr 2023 04:48:50 -0700 (PDT)
Received: from localhost ([103.152.220.91])
        by smtp.gmail.com with ESMTPSA id ha15-20020a17090af3cf00b00233acae2ce6sm1212364pjb.23.2023.04.05.04.48.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Apr 2023 04:48:49 -0700 (PDT)
Date: Wed, 5 Apr 2023 04:48:46 -0700
From: Dan Li <ashimida.1990@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Aaron Tomlin <atomlin@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
	Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@suse.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Changbin Du <changbin.du@intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>, gcc-patches@gcc.gnu.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jiri Olsa <jolsa@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kees Cook <keescook@chromium.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Marco Elver <elver@google.com>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Miguel Ojeda <ojeda@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Richard Sandiford <richard.sandiford@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>, Song Liu <song@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>,
	Uros Bizjak <ubizjak@gmail.com>, Will Deacon <will@kernel.org>,
	x86@kernel.org, Yuntao Wang <ytcoode@gmail.com>,
	Yu Zhao <yuzhao@google.com>, Zhen Lei <thunder.leizhen@huawei.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [RFC/RFT,V2] CFI: Add support for gcc CFI in aarch64
Message-ID: <20230405114846.udm4yf3xc6wdyexz@ubuntu>
References: <20221219061758.23321-1-ashimida.1990@gmail.com>
 <20230325085416.95191-1-ashimida.1990@gmail.com>
 <20230327093016.GB4253@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327093016.GB4253@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20171215

On 03/27, Peter Zijlstra wrote:
> On Sat, Mar 25, 2023 at 01:54:16AM -0700, Dan Li wrote:
> 
> > In the compiler part[4], most of the content is the same as Sami's
> > implementation[3], except for some minor differences, mainly including:
> > 
> > 1. The function typeid is calculated differently and it is difficult
> > to be consistent.
> 
> This means there is an effective ABI break between the compilers, which
> is sad :-( Is there really nothing to be done about this?

Hi Peter,

I'm not so sure right now. According to Sami's tip, I need to learn more about
related patches. I'll make it ABI compatible in the next version if possible :)

Thanks,
Dan
