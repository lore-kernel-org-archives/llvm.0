Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7598369B
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 05:00:09 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id j2so9872496ybu.0
        for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 21:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dBJcL8Qf+TxOQv4LjyViq+grimzIFiZfY7ueI3KJitY=;
        b=jxFzEkYsbLIftRWm+0RpjaJBvZdrGUbgH6K1kDQLEqksd80u/UQblgo7mgvZSERLC/
         OqMOBczKDE16cm2uUo0JOYKZF0vUk3tmN8ehFmKqo0f5qBVhhjDKGVJEdAzh1cCYV+Dv
         stq4xeJNc/VEPa2RKnQUyoH3p5wg8MhPHF2Qp0xL8BNXesL1nBjWLVwWI1xSgxfWB/Nf
         HRZWLt48WhyrO2Z3AnW8xm8c17X3VHyj39zqoQ3rkQbTSt7iEO9a2FltulP8AwYGwnth
         F1kV9/YPG+N+qa8qMsIpy73wI3F0WmyHR37/wd/prebRD+EFbAJGv1fzTyUhNJc7edaa
         KXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dBJcL8Qf+TxOQv4LjyViq+grimzIFiZfY7ueI3KJitY=;
        b=Nn3xaWnyiQrDRsazN/kpoIT0OZ9EZS64KksIbKlT8gzHukDXxdywJxFWu1Se4yM1F2
         K3QjrH83oapfmiIhnqp1eH8Qov/E1Yv0/SQ6UVYijasvb0HYkKRdEuvcaM20W19ccxyr
         ovCW6qo1Dgcge/GYIkvx/VjTGWH1xaCkzH10DHp8L5bJh8eFrE49HI3vKMC9Ok+WJo8b
         fqZEA5MShB7vKRyM0ePVD1thbENH/niN7elfW504hwVUI7NdCxKzm/Z2r4ICrMO3aCeS
         B06HRPciAcuKD7JAIQAAISOyY5/Btz9HAepYmBjnwkUNUWUuB4lYvUs07VsQ1BGSlj3W
         7rXg==
X-Gm-Message-State: AOAM531kqmHx7DiT/Kj/kiJDZet9XvipoNPZKPkk7PHmQxrmtAkeQSKv
	rZTAMBHkg5D+4GddnkqG22zmzyrHQmX8qB53ZIYq9w==
X-Google-Smtp-Source: ABdhPJwvE2obkD/N/LaYSDIcdg2fFCtX0H+0nWJZmURWhxUt52hUSSHFy3xBGUsuBtCiIY2dqk8aLATb8lKGpvuJjAA=
X-Received: by 2002:a25:286:0:b0:61d:5da1:ac65 with SMTP id
 128-20020a250286000000b0061d5da1ac65mr10662428ybc.63.1645851608342; Fri, 25
 Feb 2022 21:00:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220224145138.952963315@infradead.org> <20220224151322.307406918@infradead.org>
 <202202241627.EEF3D5D2@keescook> <YhgnA8O4Bp19hfse@dev-arch.archlinux-ax161>
 <YhlTRhh7qj538ygM@dev-arch.archlinux-ax161> <605731324a76f36aafa87bd9390808c3@overdrivepizza.com>
 <202202252055.AB16A4B8@keescook>
In-Reply-To: <202202252055.AB16A4B8@keescook>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Fri, 25 Feb 2022 20:59:57 -0800
Message-ID: <CAFP8O3LDdGKQ0HzhfmsuDRfCEWC3sAAizUTjU_UKERzseX+H3w@mail.gmail.com>
Subject: Re: [PATCH v2 05/39] x86: Base IBT bits
To: Kees Cook <keescook@chromium.org>
Cc: Joao Moreira <joao@overdrivepizza.com>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, hjl.tools@gmail.com, 
	jpoimboe@redhat.com, andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org, 
	ndesaulniers@google.com, samitolvanen@google.com, Mark.Rutland@arm.com, 
	alyssa.milburn@intel.com, mbenes@suse.cz, rostedt@goodmis.org, 
	mhiramat@kernel.org, alexei.starovoitov@gmail.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022 at 8:58 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Feb 25, 2022 at 04:29:49PM -0800, Joao Moreira wrote:
> > > https://github.com/ClangBuiltLinux/linux/issues/1606
> >
> > Candidate fix: https://reviews.llvm.org/D120600
>
> And landed! Thanks!
>
> Since this is a pretty small change, do you think it could be backported
> to the clang-14 branch?
>
> --
> Kees Cook

I have pushed it to release/14.x :)
https://github.com/llvm/llvm-project/commit/f8ca5fabdb54fdf64b3dffb38ebf7d0=
220f415a2

The current release schedule is
https://discourse.llvm.org/t/llvm-14-0-0-release-schedule/5846


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
