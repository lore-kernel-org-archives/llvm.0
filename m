Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B85536D
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 00:41:46 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-463992996d2so40813e0c.2
        for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 17:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686876105; x=1689468105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qol4pW950bVrPxMcx9m5G6bgEMEiZH+6L8x+VD8KC8A=;
        b=hzT1SI9cDM7BqgPvmr2VaaxDdIxGT2vQ0D2KW1SseHaFxTrV/HGVivpT4WRGzJRlyh
         4gDwz6Hul54N+HOohx0FuMXuMSfO+rfU8xq3HbMnhgkeCLZp3LzQHSofoCRfjeXxToH6
         M41xOOerk71Y0CBKnCEELEUVkKGpizsfoW6JHSRgAwsTdz14dkWNBZDOzLGD75kf6JlT
         jAlSYACo+rJO3d8VWNDbz0qd6l1lCqNFM7XMBhW9v7Kwrq1FpDFisEYoLsVovIdkqI+C
         GruRNrp67pOlWemOlNK2PRpMVq9QZD/lnl29e8Xn7W8ngF6uquf1qH0fyExAjubvgUpn
         8nJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686876105; x=1689468105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qol4pW950bVrPxMcx9m5G6bgEMEiZH+6L8x+VD8KC8A=;
        b=CafbqgdF8rmIc9DbdO6UbS712vSSJadkm09/YTAwqlqnSjMTs8dWm3r+WaXaDDz4eS
         u5OkX5ABgRVzS9yjVxmB6KDJq5Xzu2fClts/+7cRjEwHeqzJWICRiKGHtCcACmlcDXhG
         tHgLD/j06ztDUpy8Ffp0xnzDTtSbm8UyMNPmRW/KseiImadmcR2O4RvnggT9BsPcB6Tq
         XuvJPHiIidMGLJzdjuAUZO07VF17gM6muISO4qkJ0z9fV+TpJseF0dY/R9X4FxA4q6o2
         W0TbY4b5ORe7nHHnVl/avmz4gZu+UDkbaaBEc29jxdaBDpzTV5DcKoY58NxhB0/sJK9F
         1SSw==
X-Gm-Message-State: AC+VfDzQ3YYHVr0hISgXT/mUXbCmfIkoferQ1ndgZ76raV2mR4QNonyu
	uHhuxIcaL/6eefD8jH7pr/Ph1BmAENGziaaiils=
X-Google-Smtp-Source: ACHHUZ4dpaBRKjiODf3+MZwId8nX7G6NUoJYnfE5Hq4PElCSsMM0Nqc+53GZ0BMXmjNyDcRXMeaeQFSmN0jJgsK2aus=
X-Received: by 2002:a1f:5546:0:b0:443:6db9:24e with SMTP id
 j67-20020a1f5546000000b004436db9024emr707946vkb.15.1686876105146; Thu, 15 Jun
 2023 17:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230528131802.6390-1-ethan.twardy@gmail.com> <20230528131802.6390-2-ethan.twardy@gmail.com>
 <525fee98-c694-6a38-cd1e-dd7efd806620@gmail.com> <CTCD11G9NVTB.3SYR2GFA5VAB3@hackbook>
In-Reply-To: <CTCD11G9NVTB.3SYR2GFA5VAB3@hackbook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Jun 2023 02:41:34 +0200
Message-ID: <CANiq72=YQyqtpXZ+Hp9oySwfmBS6OJ1ik-zxXx4mSF34hruqbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] scripts/rust_is_available: Fix clang version check
To: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Cc: Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Tiago Lam <tiagolam@gmail.com>, Kees Cook <keescook@chromium.org>, Finn Behrens <me@kloenk.de>, 
	"open list:RUST" <rust-for-linux@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 2:08=E2=80=AFPM Ethan D. Twardy <ethan.twardy@gmail=
.com> wrote:
>
> Thanks very much for your testing and review. Do I need to take any
> further action to make this patch ready for review? I sent out a v3
> version of the patch, where the only change was adding Reviewed-By and
> Tested-By tags to my git commit--since this is my first time
> contributing to this community, I wasn't sure whether I needed to do
> that. Thanks!

You did everything well! The patch looked fine to me, and the commit
message is detailed. The tags are all fine too. Thanks a lot for the
effort!

I had v2 of the script improvement patch series in my backlog, which
normalizes to `sed` (rather than use `grep`/`cut` etc.), adds a test
suite, and a few other things; but otherwise we could have easily
taken this one, because it is well done.

So, you did everything right, and you are more than welcome to send
more patches like that :)

Cheers,
Miguel
