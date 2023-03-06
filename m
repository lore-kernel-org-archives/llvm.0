Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235546FC5
	for <llvm@lists.linux.dev>; Mon,  6 Mar 2023 19:18:08 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id ky4so11602371plb.3
        for <llvm@lists.linux.dev>; Mon, 06 Mar 2023 11:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678130287;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PlfUVnMpAeqg74Kjt8UEOETBGNFFbOVFaXPZinB2uzA=;
        b=t5crri0WcTaC4dbDeFT8B1Wf41RotuxLDoQ4au4TS14bhzVMaHsw9aHDiNZ/QgfigO
         pIri5VdgzvPiiJjI1Fi6ly7z7LM/WBF4IOflr++3YI+qk3fjdDueo9IiFarU45YM93jy
         InVglw2HcfH0SVosPwcOZVudDiaF8aEsAty9SKv60VRlOJ6dbXxRUnEfnuwuksQRL+oH
         MjCDHAW0mtGh5caILOuIvpWpotLpNMICgWII/CmspOGryPGZRcLIX7VDlhmcKqnho09M
         v3nqHeyXn7TJizhYBWel17Os2plRYUMcAagxx2fq7Xno7HV5B6AU7E+r1P+9n6NyddI7
         /lAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678130287;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlfUVnMpAeqg74Kjt8UEOETBGNFFbOVFaXPZinB2uzA=;
        b=Wssx1aMi9p+vdYXSKx3qvUSDfK74eDzkDonxU6dzZwNOiAIIl4dusG19BkBxSvP5F5
         wXopfi1cO/AqqgWvpOKqBVPQw3Ss/doNj5n8xLkPY3DP0wcRlQCR22NfjBed7FELTy7T
         DlIrApHO941KVb7HS9KCF6tuCC/r+LoZAYZ7pComtHBK0NCwUQAqNiOEiNvO79Zlzxnb
         ONa1jQoD5nBJ9pjXL2Y82INzAnwWtbrpn1YsY9AaZm/Lmn5aPBb+Wq+9ll/XICwqP4u8
         wsR4Mvel7XsNmTfXPP4R+7RsW3l5va/2CAfDoHNOy9j8PcXEq5dKxmhjaxLNAbM5yH4Q
         aRwA==
X-Gm-Message-State: AO0yUKUiytyG0TQksTXXN2AuaR5cESp/8SAGARmCvpaOM/txAlZP/7zb
	+OUKGTKUq2isb3ZObr6BFFdweg==
X-Google-Smtp-Source: AK7set+iNoJZ2cxy5qRgIoHSJ0YdyIfw0jMkr21udOVpB5izRmx1RUdTQKZ9Owwbph8LjbeyohY5Ag==
X-Received: by 2002:a05:6a20:5483:b0:cc:50de:a2be with SMTP id i3-20020a056a20548300b000cc50dea2bemr13625900pzk.14.1678130287404;
        Mon, 06 Mar 2023 11:18:07 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d23-20020aa78697000000b005afda149679sm6782709pfo.179.2023.03.06.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 11:18:06 -0800 (PST)
Date: Mon, 06 Mar 2023 11:18:06 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 11:17:18 PST (-0800)
Subject:     Re: [RFC 0/2] RISC-V: enable rust
In-Reply-To: <CANiq72ndkF0JM1kV=ewnO4uGirDowHDGLkhvjQgtLnuPEk_hTQ@mail.gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
  Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
  boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
  rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: miguel.ojeda.sandonis@gmail.com
Message-ID: <mhng-a7ada57e-543c-434b-a4f3-4fbda9238eb0@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sat, 25 Feb 2023 00:37:29 PST (-0800), miguel.ojeda.sandonis@gmail.com wrote:
> On Sat, Feb 25, 2023 at 12:18 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> Works for me.
>>
>> I've got a few other things in the pipeline for this merge window so
>> this probably won't make it, but I'll dig in after that.  We've got a
>> bunch of Rust-types floating around Rivos as well, so with any luck
>> someone else will have some time to poke around.  Having a full cycle in
>> linux-next is probably the right way to go for this sort of thing
>> anyway, as it's likely to shake out some long-tail issues.
>
> Thanks a lot! That would be great.
>
> At least from our side, no rush. In fact, we are letting users (or
> arch maintainers) to request/submit the architectures themselves as
> they need/want them.

It's time for the next release.  IIUC there were some authorship issues 
here, did you guys want to re-spin this with those sorted out?  I can 
give it a shot if you want, but I'm probably as likely to screw it up as 
anyone else...
