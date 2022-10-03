Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECDD2C9C
	for <llvm@lists.linux.dev>; Mon,  3 Oct 2022 23:07:34 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id n74so732397yba.11
        for <llvm@lists.linux.dev>; Mon, 03 Oct 2022 16:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nYrIZRovtEchDOXqockApvltsCTO8n79eb3xFqi9gPE=;
        b=mA5WDoLZdqwCsRey82cM7gwLGf297YOkY4UB2ETtAun+mWB0DS4nrOSBfn9/Q0GG1D
         LrEV/gsLjx/JleJeKHQS0niCdbNbAJ+rTzufd7vkHLnyZCYF8L14T75p7/qvtMg5mqQB
         q/oR5/2LT0h5O42kFdQCMid/m/YBp1d363Y5b+lVDHb7CCUA0GATJuGrO0iXdPEttuZP
         21mef1LHTKUMxwKDt0BVWJzOz+W50r+CotTZmacydSAKWlWqroE7T7x8mr9IXnSusotG
         eSeZsgawe2FR4lgl/NNSM2imE3+D7Q+5VMF122gCHHXlaBRcYZdqgnWhtxH1g6zBviCn
         HGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nYrIZRovtEchDOXqockApvltsCTO8n79eb3xFqi9gPE=;
        b=CcOr/l30bkpfVfZmy3W8p43+3/tFJ9I6yKHnwjkbNNHFiyspQznw6oXB5G730vVSU7
         oDODJKst1AHBGmQZ1fKvxT34L+crla2tiIu66ZAfHbcJOHrZqVPsRYdRQZ5V5bZHpg0Z
         Oe2Srsh25PeaGckBxQ7qpYDlIBkoAejbWou3ifyLFlOoLsDRsPQNUat3PVNQLOIFefFR
         N6jZFXhmwhKA17cCJr37/p7wHmt2bhL7NBwo6DDjJ1jcdptksyPUPqwC3kzzL+J7dIx/
         oL0po4CbzR1Ac5gTKs0FAMqyY/Xufxg1ecDBkQHlB6ZERWZ3YIyDQVLOMaFcJTrxISpf
         XJHA==
X-Gm-Message-State: ACrzQf0zDQD96b0Gox1tgD6tqBc5IeBhFY3kpMEoC943na0Rl6jWk8cw
	2mYJymFRoU9XeYyeB5m6gB5r1I/F45MysbCdu1Kcug==
X-Google-Smtp-Source: AMsMyM6r56jjoOvWBxUy3wjHa+rN57t0o+kMf2HaNDxnvEYCFqqrSL2kmOErw4q38/T5BZWBFejAqoxOi9KlrGM6SAg=
X-Received: by 2002:a25:328c:0:b0:6be:2d4a:e77 with SMTP id
 y134-20020a25328c000000b006be2d4a0e77mr457836yby.407.1664838453641; Mon, 03
 Oct 2022 16:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220812183501.3555820-1-acdunlap@google.com> <20220908170456.3177635-1-acdunlap@google.com>
 <CAMkAt6qUs526FCq26Ht48c2KVZWe=QcNds6_LE6JJbs-7Hzk+g@mail.gmail.com>
 <2625dbfa-434c-7d55-6469-9d9e89397e8f@intel.com> <YyH/tOqrl8pZmoub@google.com>
 <CAMkAt6p2Y=6sBB1JiZ2FovYXme9QBFWFu+EtnNyuQ3Db3ZhBSg@mail.gmail.com> <CAMBK9=YB=8EQymDUda300qPFAL1=7dzC61c0pshrWEC5ibrUfQ@mail.gmail.com>
In-Reply-To: <CAMBK9=YB=8EQymDUda300qPFAL1=7dzC61c0pshrWEC5ibrUfQ@mail.gmail.com>
From: Adam Dunlap <acdunlap@google.com>
Date: Mon, 3 Oct 2022 16:07:22 -0700
Message-ID: <CAMBK9=a4mR65urS3f7=V-Ukpaeqpem2M7B2B22VPC1ufES4iXg@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] x86/asm: Force native_apic_mem_read to use mov
To: Peter Gonda <pgonda@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Dave Hansen <dave.hansen@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Ben Dooks <ben-linux@fluff.org>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>, Marc Orr <marcorr@google.com>, 
	"Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

[resent with plain text]

Thanks for all the responses. Is the consensus that we should use the
readl function here or instead use inline assembly directly as in the patch
I originally sent out:

asm_inline("movl %1, %0" : "=r"(out) : "m"(*addr));

? The readl function has this exact same code, I'm just not sure
which version fits better stylistically.


On Mon, Oct 3, 2022 at 4:01 PM Adam Dunlap <acdunlap@google.com> wrote:
>
> Thanks for all the responses. Is the consensus that we should use the
> readl function here or instead use inline assembly directly as in the patch
> I originally sent out:
>
> asm_inline("movl %1, %0" : "=r"(out) : "m"(*addr));
>
> ? The readl function has this exact same code, I'm just not sure
> which version fits better stylistically.
