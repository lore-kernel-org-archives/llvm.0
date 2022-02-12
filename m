Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A4F19B
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 09:23:26 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id jg20so2464630ejc.3
        for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 01:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FQxuwYXRyYUymC0nv8LtPvAyCwq+SjfKuitASpf9b8c=;
        b=GtTztpKAfezmMys6OpEIn2nWbo/GqvB5Oos478kLkJCUxhN5olCS2zSuhE8pXPw5Hj
         9wGLVZKdpHU/v0OaCEVNZWTQvRyXrYyrWaVh6P79raY5Hd/I3oHP+l/aitRKt8IN7KBO
         ASdGBE9hBiy1tsgNkRLXr8S5P+Ma59JkbNbmU1SypL5+PkHTTSOa43HiE83Z1KwU9CWP
         u/RKeVWxJmbqFS6+aJx4WxzcoS34FLzKWnwanbYJannfskzriwZBlM8rcfEozkiAvxEX
         lYn4aTrxL4ISMBWalU0A2gymUSeGh9BpCONFDtrck4RDEAK/J0AsqmOugVh+82/Osc9J
         zTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FQxuwYXRyYUymC0nv8LtPvAyCwq+SjfKuitASpf9b8c=;
        b=gqyAgIVkNBEE/b9KYYigiv2uvL0dl4sQkQBUNUFHrJsk38sQ2LRXHnBEGp/DAbqv0K
         G3ioTjHsjBkBIxgcr4TL6GbD+hzCO+NaK3MqD8iNzyZMYauRDIyE4nbHh85NNSK+Pq5j
         ri4PMq1KAlNF78EJ2W8vuztJKyrsyfoPHs8CKyY6YioGwvQcNwfnwjTI/3NDuWzrqYGT
         uvChA1U+EDfBNMu0Y/VDhNv7KxxN8pbUsUai/rlbnAMcD2+weXY0uSBMwpJgtO6Na1Sq
         6eJ6yZ5D8QhFxLhnxuhDLFf/txqLVkga6Ey6wNJam4TV3hJ6BMGE3TPaamG91JRSZZDl
         x1Jw==
X-Gm-Message-State: AOAM5301wHSW2BsrzY9tf6Sun5i0rcQrxEXIm3rlElOTacAoXAdQqu48
	KmFBfy8IBcJDpg0QKD7e0cFCnfzETTyo1HVre0KD
X-Google-Smtp-Source: ABdhPJytMk5SxWzvQpjZUpYvjyvFSnw3e08lRh+rlrf+maOllfFiyQe6ROhhCGHgoslwjvZ5GG1YlCud3jYxHBGFxek=
X-Received: by 2002:a17:906:72de:: with SMTP id m30mr2194742ejl.163.1644657804498;
 Sat, 12 Feb 2022 01:23:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220204005742.1222997-1-morbo@google.com> <20220210223134.233757-1-morbo@google.com>
 <cb2ff5da9b704a9792549a9433dc0ac8@AcuMS.aculab.com> <CAGG=3QXvSt=d94iqSV-Y9JVNc+pt-WOZGpSeW--fp=w2ttMvUA@mail.gmail.com>
 <CAKwvOdmqQ4M1pcz1BW+MTtRdwP3itOLcV83X+1nJQkf9BNJ7Fw@mail.gmail.com>
In-Reply-To: <CAKwvOdmqQ4M1pcz1BW+MTtRdwP3itOLcV83X+1nJQkf9BNJ7Fw@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Sat, 12 Feb 2022 01:23:12 -0800
Message-ID: <CAGG=3QWmp_nXH0nkREMwRcqAcBOmGFuDifsE5t=wNjDGkLMcgg@mail.gmail.com>
Subject: Re: [PATCH v4] x86: use builtins to read eflags
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: David Laight <David.Laight@aculab.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 11, 2022 at 4:24 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> I would like to discuss this further off list with you Bill before you
> resend this patch again.

That won't be necessary.

-bw
