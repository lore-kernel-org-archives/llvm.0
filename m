Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2221F16D
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 18:02:58 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7656652da3cso89193385a.1
        for <llvm@lists.linux.dev>; Thu, 03 Aug 2023 11:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691085777; x=1691690577;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rAq2YrG+azV8Ueq6huyg+StqMdELqbivnNJUlDy0Ue4=;
        b=gAcNsTQaxhp6uB8Nt/wVO+B0jxOtfwCy2ZuFHrZajiGUHJnJdK0NKTCkGbf+ADIViO
         dRJiUhvXcEYnURopnoTseQdFerluoEDTY6KfcxY+fegbU7AVwY+AQncKaFSbD70T53Bs
         g2SkA8t8td9MxtiojO+gCUyidjMSkrohYk2hBmPzZODqiuLc9bUg71Di79eARopqlKDm
         MDGhCR1hGelRGRQ4Wt0ZEEZ2s2tpbYkOj0Yk+XNPJWO/72F8aevhQmUAdv/enQPWtWdr
         kjkY/u0pPOcIMWXWc6YEcJMulfaVL9Ryb2XUVZfJLQa6KIrffKrFW0AiYXc0WZ93bUda
         DK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085777; x=1691690577;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAq2YrG+azV8Ueq6huyg+StqMdELqbivnNJUlDy0Ue4=;
        b=CswR/fWIvyiUtZOumYvxeZDg86AbqudgIFWbRyqy550tOEk1zY3KHDLc2SvuGtAqkD
         wDADH3BdT7V+R8NI9J5EoB9btjnIwHg301VIWQD3MZzOHAlVliqYSBdVemOO6kUa3oPH
         w2w0rUoi02WvozP79kgRi8Y9Cm3O6cfNKtsfL3qMjL0tnoD6ekZOWeOYxoDABAFGB2jR
         YVJIVhHPQ5F1iVMmvCqzTYFX0MdlEAHW9w1x6pd0SZGW0AfmJKxru382anJLaXv726P0
         jTqBIdPPJcnrAZ3YFrqkyvMejAXrU1jEDxyNyCfPYB2tzZJoFjOc4RBPCX5ladWgpuoa
         gUWg==
X-Gm-Message-State: ABy/qLY33d89vPpu2nLy9QmH2bG6eWp4c2L9l1k0nxhnIPtGs6yXbOsW
	DC5do6v6yiSFLGlM4i8G8CizQccpGl8+528axhB7lA==
X-Google-Smtp-Source: APBJJlELyYpReSpW4PcwV/6/Rm8KiR7KXc8zKl/PONXDsmGCrMVmWCue5OZMKdkCAO4H3aibnMTaF6nGh1Pcy2mAmMc=
X-Received: by 2002:ad4:4b2d:0:b0:63c:62fa:745b with SMTP id
 s13-20020ad44b2d000000b0063c62fa745bmr17265920qvw.8.1691085777443; Thu, 03
 Aug 2023 11:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 11:02:46 -0700
Message-ID: <CAKwvOdm9PqNBLSZa_t5b=15cdtKvKq4q8WZr3i77W66m4FRAAQ@mail.gmail.com>
Subject: FAILED: load BTF from vmlinux: Invalid argument
To: martin.lau@linux.dev
Cc: bpf <bpf@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	=?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc?= <tpgxyz@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Martin (and BTF/BPF team),
I've observed 2 user reports with the error from the subject of this email.
https://github.com/ClangBuiltLinux/linux/issues/1825
https://bbs.archlinux.org/viewtopic.php?id=284177

Any chance you could take a look at these reports and help us figure
out what's going wrong here?  Nathan and I haven't been able to
reproduce, but this seems to be affecting OpenMandriva (and Tomasz).

Sounds like perhaps llvm-objcopy vs gnu objcopy might be a relevant detail?
-- 
Thanks,
~Nick Desaulniers
