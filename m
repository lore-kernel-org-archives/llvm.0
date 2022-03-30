Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5D629A2
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 18:05:04 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id r22so28794950ljd.4
        for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 11:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1gCGwBlFlPL7xlbgg8fVcArt1vxjlSJemINBQ6Dyvg=;
        b=pMOXFcNHgVw7MlgZ7yYEI8OIqBpCv7hHzDMln+BSnSNY+w1UBH0/mnhDTZYa2wz++N
         IVZAMs/0+Z7g4aFR7yNZrUVVucG6aeelreqX9D7ZHzcKwl0F7oYarSvbe0tnlzrgvk+6
         W0K/ANA7r6PjVTNIuVEDV7Cys+j8mpQwF7lLgTlgIL0FYGJD7tQGEPqGPYk9j0eVvPiW
         eWgbjzjR2B/gVYNdkAUT5ViAdlRMOBHxjDroMB7/wYDFp+qjh11p4MipYiygqNY/hK1W
         fQ4RILJY0OH1PCnJ/3CWJ4F5ZjF8Q3G96ruwjh2RHp5Ni34Y+kG+Znu09MLeRmtxEh8R
         rgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1gCGwBlFlPL7xlbgg8fVcArt1vxjlSJemINBQ6Dyvg=;
        b=cHEqwg5biDwtb3whW0kPnswxHcEjHeTBWFQ2bzSQZJ0ZE4XlpRjpaAzagU0Mz28pup
         dop4TRjfvgv4U7MsqUvo/566orBwiHRqZnuc7unabWhc+Uk9mSdpBv7/4dFlJ/tfRBCO
         XFszP4Y99UJToVMHc4US06N1PD8DDtsaO4LC8nxOPIEqTbuKByDi4Z3VOIT8cURWbKOn
         erHakIVc+4YxAPgqPWssC8IevzykvP4eEc0Q/9ZZYGPjIl0cVEcG0gxh8QVEKOUE0aEv
         qaEG/GwjBAEk43B3XI64eaDaZQeHbQHjzGZxzimC5/W3EKfq2T/KAD1pbpuNKpYFIUsF
         E08w==
X-Gm-Message-State: AOAM530oRtAU1WTJ7iNRZR4MOkC7kM7JTJrDrukwSfK9ryyuuG22ubLx
	ChfNRTHqUn9f010RlS1FOYy//I/Cup8BMfTX5rvkTA==
X-Google-Smtp-Source: ABdhPJzOPCdLzAuEzhP8+XwDRinp5ZhGqb9riWqDAp9YgXyUtPNaoWWz9lFTRmIqu6uYrLte8Tx/X6kn1S35WUT6kUU=
X-Received: by 2002:a2e:7808:0:b0:24a:eacb:ab9f with SMTP id
 t8-20020a2e7808000000b0024aeacbab9fmr3138533ljc.468.1648663501997; Wed, 30
 Mar 2022 11:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <164847778869.3060675.8115416881394543419.stgit@devnote2>
In-Reply-To: <164847778869.3060675.8115416881394543419.stgit@devnote2>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 30 Mar 2022 11:04:50 -0700
Message-ID: <CAKwvOdmAYQZtzGudBjmiRZNjT+VixTdNbJmYmxc7-gQNCsHfrA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] bootconfig: Support embedding a bootconfig in
 kernel for non initrd boot
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Padmanabha Srinivasaiah <treasure4paddy@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 28, 2022 at 7:29 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> KNOWN ISSUE:
>
> According to the report from Padmanabha[3] and my analysis [4], the embedded
> bootconfig data may not be updated if you do incremental build the kernel
> with CONFIG_LTO_CLANG_THIN.
>
> [3] https://lore.kernel.org/all/20220321183500.GA4065@pswork/T/#u
> [4] https://lore.kernel.org/all/20220327115526.cc4b0ff55fc53c97683c3e4d@kernel.org/
>
> This seems like clang's LTO Thin mode issue. It may not detect the inline
> asm depends on external files.
>
> I think the possible workaround is to split the inline asm which includes
> '.incbin' directive into an asm file. But this should be done in another
> seires because there are other features which uses '.incbin'. (e.g.
> /proc/config.gz)

Hi Masami,
I saw Padmanabha's report (thanks for the report); sorry for not
responding sooner, I've been traveling recently for a funeral.

Any chance we can use

CFLAGS_REMOVE_<file>.o := $(CC_FLAGS_LTO)

a la
commit d2dcd3e37475 ("x86, cpu: disable LTO for cpu.c")

with a comment linking to
https://github.com/ClangBuiltLinux/linux/issues/1618

for the Translation Units using .incbin, until we have had more time
to triage+fix?

-- 
Thanks,
~Nick Desaulniers
