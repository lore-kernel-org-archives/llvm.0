Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971E0209F5D
	for <llvm@lists.linux.dev>; Mon,  3 Feb 2025 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593897; cv=none; b=hYh0FSUOFe7c4xOa6YkSC2iQ47I/zkhauziNw9My9GmjgRiXBtsMVCFA+6a5ziNMC60YNpmbhaSuGF1BkG/mx9+R/2Zxph+dzxiSTsviHpGUTatZWnMw41Smj4fblSv+MNAbxtlUlhaQ3LqJXFrBZQ42M/zyNl9upuAihDBfuK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593897; c=relaxed/simple;
	bh=oCFTl9ONo7RNluF4OduNuYzo9TaknkGoj/lwhRP2goE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqHciRRYC0ukpUB8zA7I1wUfxqvg3+Z6e+LT2Z4e2Ou5Jfh+eq4X0H33JRbpCuj+aIgIn/qdh6iv844GKgYNVYOLVrqdkydDgB578lydGTVASxGdcJzuSYp5Lg/Xhv2pzWNE/HP0Ci1u99pjCQ+qrDSTWeTqdnE5NWG6lbIBP/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aff31b77e8so1766143137.1
        for <llvm@lists.linux.dev>; Mon, 03 Feb 2025 06:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593892; x=1739198692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=495pAs8BTk65AfSEE1DQQmDU62IOKL0yIh5oz0CPpMg=;
        b=QOg+YdvN28DzXJzGSzBJ/llSaAJXSP3k4tPJC/BCPfjst7iGDj4UkY40jDJ56cigFa
         ETcRc4maR+1Zjf864czbyUUk9YjHXUIqF3qOIE3cvWs67VF0SnHFgm9l4KsO1o3NeYG4
         RphtdpMRg7TMlxeSxaC2P37VbLtihtcD1MgqjgysaCQDyV6ZFjX3/hIf3ONML1P6ezsZ
         +2v6rSW/zzbFRGkFd6StYViNpa5FZLwmX+pCSZK7FhbAjsCs+gF3JVlZXaLhU2hF2YFo
         wdvpkqkGWpyVfaF5X5qqE1PcT3Rpa6mz0ZHGrYIsfVCdJHWYm2hbMv82iNjWV8/uakry
         IICg==
X-Forwarded-Encrypted: i=1; AJvYcCV84h2aoSX9aqHzMt9vRzL8cjq7C8vyp0WzFaqesxHlz9G5bRFiJySVOdQmenvqBceWJD50@lists.linux.dev
X-Gm-Message-State: AOJu0YyQrVvNpqmd3Yp0CPF2Vw2Dar0/nx0sfWRW6E9T4jMz/c0S1pWO
	NSojp7JRmxZ8iQwTo+LF3RlLtiAsdQEAQv1XpKhsxFSWCkGa/msMWF4SPh0i
X-Gm-Gg: ASbGncvdEBcrDSps28vrU+L5X535t+nbHvESlRfOEs6cjpLm/0AzqxO14uKkKgNrzdf
	uwikIXt33Cnn9gwrLGS1lpjJBCNP0mGjW2t9m4ly4OKlqVDez5WgWeqJKuNryPoP3AP3ala8Uki
	Q6ANAvdBNSZKZoChCYcuzfyH4RoBHmy3n3dLZyTwNfXInznwNH5C9e8C3XdcStBDNao+fasj9bg
	lrx5ilt/nHzcYt8KV9PbwQlIzYNsZbovpd3mN3gmeDTdy45358FsmVA86+7EHhV0NBzsZNRRQl8
	HzzJnTp0atfTbFVOY9MV8kiGr/K4J5H+IbgTj1pzRIIIEwhIE2/1yA==
X-Google-Smtp-Source: AGHT+IHIZNi+dbq37OcQuKWL2AL8ZEpuAyBNclyyT6u6KTQhrepXUVfEbwtCKTNcsHqz/NFoRk1S5A==
X-Received: by 2002:a05:6102:5487:b0:4af:ea3b:7b31 with SMTP id ada2fe7eead31-4b9a4f8f2c7mr14321766137.14.1738593892410;
        Mon, 03 Feb 2025 06:44:52 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866940a9b50sm1468237241.18.2025.02.03.06.44.51
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:44:51 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afdf8520c2so1382575137.2
        for <llvm@lists.linux.dev>; Mon, 03 Feb 2025 06:44:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXqpcyOuVBHOm6xENDwX7UqT8ALvXwhRQaS9pCzZjuI7xxbtTIs+YVZaT7cO630O3tooQ+y@lists.linux.dev
X-Received: by 2002:a05:6102:2acf:b0:4af:f275:e752 with SMTP id
 ada2fe7eead31-4b9a5269b95mr14933042137.22.1738593891606; Mon, 03 Feb 2025
 06:44:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250127190636.it.745-kees@kernel.org> <20250127191031.245214-2-kees@kernel.org>
In-Reply-To: <20250127191031.245214-2-kees@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Feb 2025 15:44:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXW8VbtOAixO7w+aDOG70aZtZ50j1Ybcr8B3eYnRUcrcA@mail.gmail.com>
X-Gm-Features: AWEUYZn4f2U45kmhTSRYxW6gXgpadIvKhLBo_20ukhjFkcFf9ymUqDMOZnVdOso
Message-ID: <CAMuHMdXW8VbtOAixO7w+aDOG70aZtZ50j1Ybcr8B3eYnRUcrcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] stackinit: Add union initialization to selftests
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jakub Jelinek <jakub@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kees,

On Mon, 27 Jan 2025 at 20:11, Kees Cook <kees@kernel.org> wrote:
> The stack initialization selftests were checking scalars, strings,
> and structs, but not unions. Add union tests (which are mostly identical
> setup to structs). This catches the recent union initialization behavioral
> changes seen in GCC 15. Before GCC 15, this new test passes:
>
>     ok 18 test_small_start_old_zero
>
> With GCC 15, it fails:
>
>     not ok 18 test_small_start_old_zero
>
> Specifically, a union with a larger member where a smaller member is
> initialized with the older "= { 0 }" syntax:
>
> union test_small_start {
>      char one:1;
>      char two;
>      short three;
>      unsigned long four;
>      struct big_struct {
>              unsigned long array[8];
>      } big;
> };
>
> This is a regression in compiler behavior that Linux has depended on.
> GCC does not seem likely to fix it, instead suggesting that affected
> projects start using -fzero-init-padding-bits=unions:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118403
>
> Signed-off-by: Kees Cook <kees@kernel.org>

I ran stackinit_kunit from v6.14-rc1 on m68k under ARAnyM.
All small_start tests failed:

KTAP version 1
1..1
    KTAP version 1
    # Subtest: stackinit
    # module: stackinit_kunit
    1..108
    ok 1 test_u8_zero
    ok 2 test_u16_zero
    ok 3 test_u32_zero
    ok 4 test_u64_zero
    ok 5 test_char_array_zero
    ok 6 test_small_hole_zero
    ok 7 test_big_hole_zero
    ok 8 test_trailing_hole_zero
    ok 9 test_packed_zero
    ok 10 test_small_hole_old_zero
    ok 11 test_big_hole_old_zero
    ok 12 test_trailing_hole_old_zero
    ok 13 test_packed_old_zero
    ok 14 test_same_sizes_zero
    # test_small_start_zero: ASSERTION FAILED at lib/stackinit_kunit.c:428
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 15 test_small_start_zero
    ok 16 test_small_end_zero
    ok 17 test_same_sizes_old_zero
    # test_small_start_old_zero: ASSERTION FAILED at lib/stackinit_kunit.c:429
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 18 test_small_start_old_zero
    ok 19 test_small_end_old_zero
    ok 20 test_small_hole_dynamic_partial
    ok 21 test_big_hole_dynamic_partial
    ok 22 test_trailing_hole_dynamic_partial
    ok 23 test_packed_dynamic_partial
    ok 24 test_small_hole_assigned_dynamic_partial
    ok 25 test_big_hole_assigned_dynamic_partial
    ok 26 test_trailing_hole_assigned_dynamic_partial
    ok 27 test_packed_assigned_dynamic_partial
    ok 28 test_same_sizes_dynamic_partial
    # test_small_start_dynamic_partial: ASSERTION FAILED at
lib/stackinit_kunit.c:438
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 29 test_small_start_dynamic_partial
    ok 30 test_small_end_dynamic_partial
    ok 31 test_same_sizes_assigned_dynamic_partial
    # test_small_start_assigned_dynamic_partial: ASSERTION FAILED at
lib/stackinit_kunit.c:441
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 32 test_small_start_assigned_dynamic_partial
    ok 33 test_small_end_assigned_dynamic_partial
    ok 34 test_small_hole_static_partial
    ok 35 test_big_hole_static_partial
    ok 36 test_trailing_hole_static_partial
    ok 37 test_packed_static_partial
    ok 38 test_small_hole_static_all
    ok 39 test_big_hole_static_all
    ok 40 test_trailing_hole_static_all
    ok 41 test_packed_static_all
    ok 42 test_small_hole_dynamic_all
    ok 43 test_big_hole_dynamic_all
    ok 44 test_trailing_hole_dynamic_all
    ok 45 test_packed_dynamic_all
    ok 46 test_small_hole_runtime_partial
    ok 47 test_big_hole_runtime_partial
    ok 48 test_trailing_hole_runtime_partial
    ok 49 test_packed_runtime_partial
    ok 50 test_small_hole_runtime_all
    ok 51 test_big_hole_runtime_all
    ok 52 test_trailing_hole_runtime_all
    ok 53 test_packed_runtime_all
    ok 54 test_small_hole_assigned_static_partial
    ok 55 test_big_hole_assigned_static_partial
    ok 56 test_trailing_hole_assigned_static_partial
    ok 57 test_packed_assigned_static_partial
    ok 58 test_small_hole_assigned_static_all
    ok 59 test_big_hole_assigned_static_all
    ok 60 test_trailing_hole_assigned_static_all
    ok 61 test_packed_assigned_static_all
    ok 62 test_small_hole_assigned_dynamic_all
    ok 63 test_big_hole_assigned_dynamic_all
    ok 64 test_trailing_hole_assigned_dynamic_all
    ok 65 test_packed_assigned_dynamic_all
    ok 66 test_same_sizes_static_partial
    # test_small_start_static_partial: ASSERTION FAILED at
lib/stackinit_kunit.c:437
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 67 test_small_start_static_partial
    ok 68 test_small_end_static_partial
    ok 69 test_same_sizes_static_all
    # test_small_start_static_all: ASSERTION FAILED at lib/stackinit_kunit.c:437
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 70 test_small_start_static_all
    ok 71 test_small_end_static_all
    ok 72 test_same_sizes_dynamic_all
    # test_small_start_dynamic_all: ASSERTION FAILED at
lib/stackinit_kunit.c:438
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 73 test_small_start_dynamic_all
    ok 74 test_small_end_dynamic_all
    ok 75 test_same_sizes_runtime_partial
    # test_small_start_runtime_partial: ASSERTION FAILED at
lib/stackinit_kunit.c:439
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 76 test_small_start_runtime_partial
    ok 77 test_small_end_runtime_partial
    ok 78 test_same_sizes_runtime_all
    # test_small_start_runtime_all: ASSERTION FAILED at
lib/stackinit_kunit.c:439
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 79 test_small_start_runtime_all
    ok 80 test_small_end_runtime_all
    ok 81 test_same_sizes_assigned_static_partial
    # test_small_start_assigned_static_partial: ASSERTION FAILED at
lib/stackinit_kunit.c:440
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 82 test_small_start_assigned_static_partial
    ok 83 test_small_end_assigned_static_partial
    ok 84 test_same_sizes_assigned_static_all
    # test_small_start_assigned_static_all: ASSERTION FAILED at
lib/stackinit_kunit.c:440
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 85 test_small_start_assigned_static_all
    ok 86 test_small_end_assigned_static_all
    ok 87 test_same_sizes_assigned_dynamic_all
    # test_small_start_assigned_dynamic_all: ASSERTION FAILED at
lib/stackinit_kunit.c:441
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 88 test_small_start_assigned_dynamic_all
    ok 89 test_small_end_assigned_dynamic_all
    ok 90 test_small_hole_assigned_copy # SKIP XFAIL uninit bytes: 1
    ok 91 test_big_hole_assigned_copy # SKIP XFAIL uninit bytes: 124
    ok 92 test_trailing_hole_assigned_copy # SKIP XFAIL uninit bytes: 1
    ok 93 test_packed_assigned_copy
    ok 94 test_same_sizes_assigned_copy
    # test_small_start_assigned_copy: ASSERTION FAILED at
lib/stackinit_kunit.c:442
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 95 test_small_start_assigned_copy
    ok 96 test_small_end_assigned_copy
    ok 97 test_u8_none
    ok 98 test_u16_none
    ok 99 test_u32_none
    ok 100 test_u64_none
    ok 101 test_char_array_none
    ok 102 test_switch_1_none # SKIP XFAIL uninit bytes: 80
    ok 103 test_switch_2_none # SKIP XFAIL uninit bytes: 80
    ok 104 test_small_hole_none
    ok 105 test_big_hole_none
    ok 106 test_trailing_hole_none
    ok 107 test_packed_none
    ok 108 test_user
# stackinit: pass:90 fail:13 skip:5 total:108
# Totals: pass:90 fail:13 skip:5 total:108
not ok 1 stackinit

m68k-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU
Binutils for Ubuntu) 2.42
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
