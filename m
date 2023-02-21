Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D144A33C4
	for <llvm@lists.linux.dev>; Tue, 21 Feb 2023 20:40:11 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id e10so2343493ilu.4
        for <llvm@lists.linux.dev>; Tue, 21 Feb 2023 12:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhJ03HWaHgcQf5OOYhlL9i+S+dAZS2VRK1yIdsqmC7s=;
        b=b6ktkeNj8WV1cTpi4ZZdby245M/K7jo3YcUSE0syTwjhuTI7mywNeTt//HMF69Mx9E
         2YSGktOCxrRiJjbofyxPuH85woOah/dfpZTvUoTgEwvXC5MIwdUg/T/jocbAG9A5qUFa
         JAgl32076dnrIx7tdF1gADyv3jbo6S9CvGd8YvsSPdem3Tt+ZZOWBq21rgNcSwdAMKnE
         sSIyFrMeg1KHXavwRjQbFSRGt/Od4D0VkMU8kcknlTUkoP36pboBg6I1KAGAyCXI8yLm
         yKmwsgyIyS3rvJCBYJ24/a7OC8H+SWakfZRON6Kkliz5dTEE0tGTSjctsLRBCFmhqIY1
         akQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yhJ03HWaHgcQf5OOYhlL9i+S+dAZS2VRK1yIdsqmC7s=;
        b=Q/B9jTV0RXjX4T3ARZLycDGrDxqIjyKvpjGx//3oUqk9ScMB1LJWVdW8uRymcyTskR
         vkwAVR4r0BxdSjGz3ubFAJJHDScbZwB6gSi3hCw+AGXzplLkrH0E5yIYWGIT7wGO+EkW
         BOcG0Xa1n3z+1eTSTQDd3tqJZ9RstK8tM4V392qZNqOTWDBq1CAznSaAvwij6BoaOrbQ
         n5+CrwSSIa0GRAwqR3bH2mpgTD9P58QBJYTgyVXK1eXQAt7cz/nUzLgCyn91qlkOLi7q
         JrVJKOZ0/BOv8RFQHBC2XudeIz7iUuKDRmAVOis06P7+qCq/dOdz8XAEkcI83Nr5rl4y
         1aaQ==
X-Gm-Message-State: AO0yUKXD4aH6xFPPbd3PhZJgojNEWmA2aB/9QcfLkOAOr9DtTlOQIVBm
	o3IqlEeml8swI5oTCJK34pPszA==
X-Google-Smtp-Source: AK7set88KnKoKx+kHGOs5DNe/wu/M+9pYE9ROIHJ7WN0WfN4v9J5xt/zSSCAbRWyJVWCa46eLmwPng==
X-Received: by 2002:a92:cd8e:0:b0:315:459a:8bd with SMTP id r14-20020a92cd8e000000b00315459a08bdmr6555310ilb.25.1677012010889;
        Tue, 21 Feb 2023 12:40:10 -0800 (PST)
Received: from [172.16.32.78] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id r2-20020a922a02000000b00313ca4be5e1sm756486ile.12.2023.02.21.12.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 12:40:10 -0800 (PST)
Message-ID: <b455394f-9faa-1f1a-f171-0b9d5e9ada35@landley.net>
Date: Tue, 21 Feb 2023 14:53:30 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kbuild@vger.kernel.org,
 Li Zhe <lizhe.67@bytedance.com>, llvm@lists.linux.dev,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Peter Zijlstra <peterz@infradead.org>
From: Rob Landley <rob@landley.net>
Subject: [PATCH 0/5] Patches used to build mkroot.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The ~300 line bash script in toybox that builds bootable Linux systems
for a dozen-ish targets can use a vanilla kernel, but the binaries I
ship are built from a kernel with these patches:

https://github.com/landley/toybox/blob/master/scripts/mkroot.sh
https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/

I've posted each patch to the list already, but here they are together
and updated for 6.2:

1) let LLVM build normally without telling Linux on the command line
This way I can mix CROSS_COMPILE=$ARCH-unknown-linux-cross- without
having to care that some are llvm and some are gcc.

2) don't require an extra dependency to build x86-64 no other target needs.

3) Make CONFIG_DEVTMPFS_MOUNT work in initramfs. That way having
the kernel build archive up a directory into a cpio.gz as a normal
user doesn't leave me without a /dev/console and thus init running
with stdin/stderr/stdout closed.

4) Replace the only user of bc with c. (Another package dependency
with only one user.)

5) Fix rootfstype=tmpfs in initramfs. (A thinko I made in 2013 which
nobody else has bothered to fix for a decade now.)
