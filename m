Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E12B6136
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 22:07:58 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id t14so4250142ljh.8
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 14:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6IlbQWXqli0bmJJpEgImJp1eEsIqn79OOyyTrciOKiU=;
        b=ZEZMRswskOjswx6tJdzOvd++uDOMnhizQ9xgMMjRdj2BFHJllPm9AMgDZ8dtNx2AE4
         lstU8jkmYtaE4AJOYbLN9mzvDZkWEVRfNSoJx2hjNTCBMYYjABkC9jPrQEc3TSTQGotl
         WetlPAt5KoS7AZpTnWofwgwyxQvdkqsf6AkbgPXNnHlMTH+a9SN1E093aSV4gY7YKM/Y
         JKNiYiBqBO4+4Gbxo2eolwv2M4Yofo6Di41Wkj/TIBtGyh/RCOYExF7X+dQlfIMO/CsI
         TtyNhQWqOjdRHlrkhjeKImuKiFcJmE6cQ2yYT83Gh/SGdxPKbE3VTLJB6qCdrdCv9Dyw
         FUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6IlbQWXqli0bmJJpEgImJp1eEsIqn79OOyyTrciOKiU=;
        b=JOne4XRTwYO0lhfSHArEzjl7kZyS/kALaE6dDr80oTCDcksos1topyQUI8Az90PR5+
         iK+K3wH86gfJEOdJvmU+wHzMH29k1EKv2X7dwjbz1mKbOv1qC3A4TENPi1M4BJd4GxN8
         RoFud67KL4T9PfMuhqkJ4LRaW0ZT8Tbux8zrmBtp6HmJcTH9sJHKnDMYXe0EHC8IuUT8
         AtGao1B4Wu6ODdOrMjArzqj0zGFUvF4X9ZYVgyI2o/+JFLTalZklpt4P3mWkADbBPjcN
         gx1hkc/o3Ni8SY+Zn23IcebeqxnSZXc2AcQ8msD4ZiJ1MHXNjzrZh+HF17TTRWvESgrY
         5nfQ==
X-Gm-Message-State: AOAM530d8LYzRyWV6Ug5MSYwMTgxASZPX7V+vqzrDHxLgsXdMY8mbBgB
	J9oDlh8Rj7q6DY0SsfbOw/u5HZoXdLcQBXXaewd+tQ==
X-Google-Smtp-Source: ABdhPJxvXZVvpAwnwfaWp0w0zI5ONop0YB93AcJksBmO2Pv9KbxT0bwVjHz9OXE1PXZZorxAK0BiXEmEYwJy2rrxEA0=
X-Received: by 2002:a05:651c:1542:b0:233:8ff5:eb80 with SMTP id
 y2-20020a05651c154200b002338ff5eb80mr21217835ljp.352.1646258876867; Wed, 02
 Mar 2022 14:07:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220224145138.952963315@infradead.org> <20220224151322.072632223@infradead.org>
 <CAKwvOdkD2WY=hEHy8_0zs70AGx6LRQwxL5mEZyB30uqpruYJyA@mail.gmail.com>
 <Yh+dMJsH+ZMPfqwD@thelio-3990X> <CAKwvOdmouBTe5pH3JoP6EEfwNT5=6WvX3oCEZRxO0Dkf38S14w@mail.gmail.com>
 <Yh/egU1LZudfrgVy@dev-arch.thelio-3990X>
In-Reply-To: <Yh/egU1LZudfrgVy@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Mar 2022 14:07:45 -0800
Message-ID: <CAKwvOdkN+pT_og0QjX+MM1dDL8-CMzt8i73tXoguB49Qza3zJA@mail.gmail.com>
Subject: Re: [PATCH v2 01/39] kbuild: Fix clang build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, keescook@chromium.org, x86@kernel.org, 
	joao@overdrivepizza.com, hjl.tools@gmail.com, jpoimboe@redhat.com, 
	andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org, 
	samitolvanen@google.com, mark.rutland@arm.com, alyssa.milburn@intel.com, 
	mbenes@suse.cz, rostedt@goodmis.org, mhiramat@kernel.org, 
	alexei.starovoitov@gmail.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 2, 2022 at 1:15 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Mar 02, 2022 at 11:18:07AM -0800, Nick Desaulniers wrote:
> > I'd be much more amenable to that approach.
>
> Sounds good, tentative patch attached, it passes all of my testing.
> There is an instance of $(LLVM) in tools/testing/selftests/lib.mk that I
> did not touch, as that will presumably have to go through the selftests
> tree. I can send a separate patch for that later.

LGTM!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
