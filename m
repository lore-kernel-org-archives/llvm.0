Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518712F5A
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 17:12:31 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id q18so13111226ljg.12
        for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 10:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=oJRG7uz6WGBbtCoGOSmHQY70YgBhBuqvMftRIStyMs0=;
        b=NdGEu09reixZxX3m/TPNxIYeFZ7fr5WNqIF0qIYTfmeK1vx24ssEvai7OW9XAB7KNn
         R9TzKHZLK3CeuHeGzHjOqaD+NYMU6prJ46EAlmE/taiviOKUz4wwlVrHApU2usky32xx
         bvV+2KT+rjw7Zbix0OOybgaCTm4MPw59fQEmXzllwnB+ouyMhjojKx1YI1pcms4nmYuF
         AeX8//PGbdMgfwghAEl154yq6ojmHvjaakHMOFwWtotLye03UoWu8afnTvcSzEW3RAbW
         kc4PHWxpXwNxGRhgsnWIid8EnsmhRnlF6gGyBgOcL3kFt3A/EFZ2KIrXyHbgh3WRCtss
         CJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=oJRG7uz6WGBbtCoGOSmHQY70YgBhBuqvMftRIStyMs0=;
        b=eCuwAZQONIKxGMt1Ei4/pKw8BERwCuu3kfuAJFM1IEfS6dNnN+IaaObnM4kEHWL1gK
         9APBL7sNTD68QylZ6zhr98ribualF7GNe1+LNkXh6AYy3guqm2vBwrd1NkELQli5UE+D
         ebsbzXrJDUgYyio8EaJ1UKozP9OIbbVzeZMBYIflet1Rp3oVgQIPWSow7OgkvzzrSg3y
         Q1T1vg8xyDWQ+R5UOcUsmUNgARIsc99IVHhYh/smnmgCWJk8pMQ3q+t/21bNI+ThiLIK
         C3BcJ9EbNqWvGbYQurQymjV6frNOl4LAmGUat846OE3OhKtf6v9dolOWqnNWVH0iKAsw
         //Dg==
X-Gm-Message-State: ACgBeo3wMuTGh1O5ouK5Nh4tUIFZi4ika0dbay7l1pwUCUG2U6r9BhS2
	x1uuVjrIu3jzagC923jFo7QGd7HC5qMsd0cn6k+ksA==
X-Google-Smtp-Source: AA6agR4SxIHfG8HjtHB58neDIxlJ5dnDXtAbRUJyYQemYFIbKyNpGne5qu+VB3chjqUwB3l3YjEBkbSNDj6xY4aGph8=
X-Received: by 2002:a05:651c:31b:b0:261:df26:53ba with SMTP id
 a27-20020a05651c031b00b00261df2653bamr585838ljp.513.1661274749104; Tue, 23
 Aug 2022 10:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220812114438.1574-1-mailhol.vincent@wanadoo.fr> <20220812114438.1574-3-mailhol.vincent@wanadoo.fr>
 <YwT+5GGCOKoTjfQZ@zn.tnic>
In-Reply-To: <YwT+5GGCOKoTjfQZ@zn.tnic>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 23 Aug 2022 10:12:17 -0700
Message-ID: <CAKwvOdnc-Js8x4sv0j23crtYP73sRkNexom5ydm=r=8rYgc_5Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] x86/asm/bitops: __ffs,ffz: use __builtin_ctzl to
 evaluate constant expressions
To: Borislav Petkov <bp@alien8.de>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 9:23 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Aug 12, 2022 at 08:44:38PM +0900, Vincent Mailhol wrote:
> > __ffs(x) is equivalent to (unsigned long)__builtin_ctzl(x)
>
> Are you sure about this?
>
> My gcc documentation says:
>
> "Built-in Function: int __builtin_ctz (unsigned int x)
>
>     Returns the number of trailing 0-bits in x, starting at the least significant bit position. If x is 0, the result is undefined."
>
> Note the undefined part.
>
> Also,
>
> __builtin_ctzl(0): 0x40
> ffs(0): 0x0
>
> I'm using the kernel ffs() version in a small program which is basically
> a wrapper around BSF.

Callers of these need to guard against zero input, as the pre-existing
comment notes:

>> Undefined if no bit exists, so code should check against 0 first.
-- 
Thanks,
~Nick Desaulniers
