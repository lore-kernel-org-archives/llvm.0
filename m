Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0631D50A67
	for <llvm@lists.linux.dev>; Tue,  7 May 2024 03:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715054181; cv=none; b=NOqO/FF5n0BnxfpvELLf2v8mtS3hIaL0K+TbU+ek+/cBOMyyxdK90kUoyJ/NAnbiOgonk76VPeDilPwPIxlzW9425RXFITwQrIZ6lGdFShKN1iQtGWxmMJb71KLjsgvq3ynBfZgU3a8k4aEtHz7M7ldQLNTsTprjzpisYtvC3T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715054181; c=relaxed/simple;
	bh=uHGCgFTf2PoULArgJkw20TEvZCTEKOhTb7AlWBgjnHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMCXQZDp6PaiWZijnqZfmZq5zin7QjazeBSiyrV/2Ey6yxupK2HY7NBb8Uq1RVDyAQvVTcg1qQFDNStrOJ7l1Yicjbj8rFpnQH4KxVnVrYS0iT4oi5WMxMaVY7/Ks36cRqjPTxVDrjnfBkM8pA/j7XBxDlVkG2lpt1ZKXrppNrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i40L+8CR; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i40L+8CR"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7f74cca5a35so654602241.3
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 20:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715054179; x=1715658979; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEPSTkzCONFhi4zhV16EOLzI7dVRIqWkcaUFzFQRbWU=;
        b=i40L+8CR8kJgOXKgl8ybghiHJ6G3hJkrgOdDR9opy1I4qnEH3nJjG7AZivCAkX3DZN
         xLj4yeT/cLxTwMvdVndUPdh9Yu3Ag7kRlNIwGvnI5QDOkALHeli4i3Oj3KGsSWU1DXfW
         IqEDJQY2xjx6z5Oo2aOWDn2T1bKBzocgm/CR5lPCeESmb01jhQ9MZOb+wW3P6XUAikIk
         KaEgLFEYfqv2JxEAMiWY0SIkWX1+Dz5X2JylUm9OU09eUGtq767bv/4t+iQ7vZiQruDp
         aXkQeBVrgGNhYeFF0TfGnMmzA9tuydtpETzvox4ODNDHWA1WElBj4w5CPqt6AgWh7ZsJ
         FhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715054179; x=1715658979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEPSTkzCONFhi4zhV16EOLzI7dVRIqWkcaUFzFQRbWU=;
        b=vygy18loI5KJ4sF0wvJzDLdyf4BveHauT9+RmEWuv8sOy5oGZOTPzRwV6AGNtAsZYo
         7NIQKDBUEnEYNi+adiJYzWGxnT/8bAV3WxFTjAVYbrTfRnJbsdzPaxFZTYNjw5Fo6N+/
         6VZYouFvD3RqF6MSB5LTMISX2Yw8mzmCazLpnNm34cO06Nyevumlp7kAHDCNNJCu0K40
         G9EU7ZQXRtBBLsJZ/VCOXVt4by4oksqPu3OUNIBGfMX4VTEea8rupUruqCfEZmB613Ui
         RXCFHD1fhsaYkUNAgzG4z+eumaMSzPs/pBpAzNvAPzGrwRk6+oKtp29Npd1D83Hu989G
         q3Pg==
X-Forwarded-Encrypted: i=1; AJvYcCW0izKg1norwuiJmla6OlMV+cntBtHwpz3rKZ9HNatH4MHiYjbX9lSf+rm6hIkAwIOifxuZizp9uIRhwBrcbEwdH+tSRQ==
X-Gm-Message-State: AOJu0YxKd7pJeni02BW4ewMw466fXPBK73nB4ysQzonx4JzrEYOi8KmU
	u8NO3UKCibsbyq/QMBmzqz8s+jltzMbDQgnZ/6n8AIWJUv4C6T0nuGRjTb+OJ0mBrvQQMiSFPvz
	1koEZgAI8g+A+8twCVE2go/noWoawCzRkfGxLnsyakshvSYM3nXYDygU=
X-Google-Smtp-Source: AGHT+IGShhYWI6mZpEjTIv/wXY/NMt0EKm8Ye6Q6/YQzd9ugb43BRYG+szXDcFahkTSWN8/XZTM0Mr7dHM+D+OZw+Fs=
X-Received: by 2002:a67:f7c5:0:b0:47e:a1fc:3b82 with SMTP id
 a5-20020a67f7c5000000b0047ea1fc3b82mr12655312vsp.35.1715054178173; Mon, 06
 May 2024 20:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240507-b4-sio-block-ioctl-v2-1-e11113aeb10f@google.com>
In-Reply-To: <20240507-b4-sio-block-ioctl-v2-1-e11113aeb10f@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 6 May 2024 20:56:06 -0700
Message-ID: <CAFhGd8rVZER=F9akZhdv0q=GXdVqvCNNdvWh8VKnOYmvTM3d+Q@mail.gmail.com>
Subject: Re: [PATCH v2] block/ioctl: prefer different overflow check Running
 syzkaller with the newly reintroduced signed integer overflow sanitizer shows
 this report:
To: Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 8:48=E2=80=AFPM Justin Stitt <justinstitt@google.com=
> wrote:
>

Agh. Sorry about the noise, the first line of my patch body got eaten
by the subject line because a new line was missing in mutt.

FIXED in [v3] for real this time.

> [   62.982337] ------------[ cut here ]------------
> [   62.985692] cgroup: Invalid name
> [   62.986211] UBSAN: signed-integer-overflow in ../block/ioctl.c:36:46
> [   62.989370] 9pnet_fd: p9_fd_create_tcp (7343): problem connecting sock=
et to 127.0.0.1
> [   62.992992] 9223372036854775807 + 4095 cannot be represented in type '=
long long'
> [   62.997827] 9pnet_fd: p9_fd_create_tcp (7345): problem connecting sock=
et to 127.0.0.1
> [   62.999369] random: crng reseeded on system resumption
> [   63.000634] GUP no longer grows the stack in syz-executor.2 (7353): 20=
002000-20003000 (20001000)
> [   63.000668] CPU: 0 PID: 7353 Comm: syz-executor.2 Not tainted 6.8.0-rc=
2-00035-gb3ef86b5a957 #1
> [   63.000677] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.16.3-debian-1.16.3-2 04/01/2014
> [   63.000682] Call Trace:
> [   63.000686]  <TASK>
> [   63.000731]  dump_stack_lvl+0x93/0xd0
> [   63.000919]  __get_user_pages+0x903/0xd30
> [   63.001030]  __gup_longterm_locked+0x153e/0x1ba0
> [   63.001041]  ? _raw_read_unlock_irqrestore+0x17/0x50
> [   63.001072]  ? try_get_folio+0x29c/0x2d0
> [   63.001083]  internal_get_user_pages_fast+0x1119/0x1530
> [   63.001109]  iov_iter_extract_pages+0x23b/0x580
> [   63.001206]  bio_iov_iter_get_pages+0x4de/0x1220
> [   63.001235]  iomap_dio_bio_iter+0x9b6/0x1410
> [   63.001297]  __iomap_dio_rw+0xab4/0x1810
> [   63.001316]  iomap_dio_rw+0x45/0xa0
> [   63.001328]  ext4_file_write_iter+0xdde/0x1390
> [   63.001372]  vfs_write+0x599/0xbd0
> [   63.001394]  ksys_write+0xc8/0x190
> [   63.001403]  do_syscall_64+0xd4/0x1b0
> [   63.001421]  ? arch_exit_to_user_mode_prepare+0x3a/0x60
> [   63.001479]  entry_SYSCALL_64_after_hwframe+0x6f/0x77
> [   63.001535] RIP: 0033:0x7f7fd3ebf539
> [   63.001551] Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 14 00 00 90 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> [   63.001562] RSP: 002b:00007f7fd32570c8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000001
> [   63.001584] RAX: ffffffffffffffda RBX: 00007f7fd3ff3f80 RCX: 00007f7fd=
3ebf539
> [   63.001590] RDX: 4db6d1e4f7e43360 RSI: 0000000020000000 RDI: 000000000=
0000004
> [   63.001595] RBP: 00007f7fd3f1e496 R08: 0000000000000000 R09: 000000000=
0000000
> [   63.001599] R10: 0000000000000000 R11: 0000000000000246 R12: 000000000=
0000000
> [   63.001604] R13: 0000000000000006 R14: 00007f7fd3ff3f80 R15: 00007ffd4=
15ad2b8
> ...
> [   63.018142] ---[ end trace ]---
>
> Historically, the signed integer overflow sanitizer did not work in the
> kernel due to its interaction with `-fwrapv` but this has since been
> changed [1] in the newest version of Clang; It being re-enabled in the
> kernel with Commit 557f8c582a9ba8ab ("ubsan: Reintroduce signed overflow
> sanitizer").
>
> Let's rework this overflow checking logic to not actually perform an
> overflow during the check itself, thus avoiding the UBSAN splat.
>
> [1]: https://github.com/llvm/llvm-project/pull/82432
>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Changes in v2:
> - don't use check_add_overflow as I accidentally was writing to p.start
>   and the alternative of using a dummy (unused) variable does not seem gr=
eat.
> - Link to v1: https://lore.kernel.org/r/20240506-b4-sio-block-ioctl-v1-1-=
da535cc020dc@google.com
> ---
>  block/ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/ioctl.c b/block/ioctl.c
> index f505f9c341eb..2639ce9df385 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -33,7 +33,7 @@ static int blkpg_do_ioctl(struct block_device *bdev,
>         if (op =3D=3D BLKPG_DEL_PARTITION)
>                 return bdev_del_partition(disk, p.pno);
>
> -       if (p.start < 0 || p.length <=3D 0 || p.start + p.length < 0)
> +       if (p.start < 0 || p.length <=3D 0 || LLONG_MAX - p.length < p.st=
art)
>                 return -EINVAL;
>         /* Check that the partition is aligned to the block size */
>         if (!IS_ALIGNED(p.start | p.length, bdev_logical_block_size(bdev)=
))
>
> ---
> base-commit: 0106679839f7c69632b3b9833c3268c316c0a9fc
> change-id: 20240506-b4-sio-block-ioctl-78efd742fff4
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>

[v3]: https://lore.kernel.org/all/20240507-b4-sio-block-ioctl-v3-1-ba0c2b32=
275e@google.com/

Thanks
Justin
