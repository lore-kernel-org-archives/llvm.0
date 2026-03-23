Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F23D3B47D6
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280334; cv=pass; b=bjDagiYR2DC9YQRnB/bkOO/mw22wuEfIEJ0F24uOPT1u/t2qJEkzFuhfUWb0iPZuEFf+N8ILKSEqy5mzSv92FkkZHBS364oLwl2JS75t2vt0shj/mbVvqtpH3iAsGY3H2gRzLSzEC3c7Inauc2UC/oHwwEXVZBW08x2fHpiLDDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280334; c=relaxed/simple;
	bh=ZmWh/DuRvSZu1elnpeWrQV+U187fmJiYXIaGuwiNT00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALi2YsCcMSPHUcnkngws8ans4rwiNcJvpupR5XM9XOGxFha6mfThIuF2oRAiXyiFujgX+qMRiKe5bpb7QWEt/CIOCeNFLrsbRXtCFcYBuDdSuusugetNbLgzjutMEhZkWsVU/91koHBghfyL0seBkd/tMRU/NDRYL62s000JPLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UihAU7mh; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UihAU7mh"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-899fbf92bdbso51758146d6.0
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 08:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774280332; cv=none;
        d=google.com; s=arc-20240605;
        b=NUyv/Wwhl18Mq3xsI+KNvck6OcGe1Rp+ehaJjKaMswIueJR5kAyDpoezOEFoWvt6m/
         Lb9iToDv63mf5s9QRlPgDZHSny/Ns9ABkpXlr25RZU77H5pRPZ4vPkkj9vfaz5//4C+0
         vSMDcCx5ERoeXTlPOYo0K4mAZq8XAQY4TZP/stA+JqThfrulLJmHzmlhGfLtW1rjlbWg
         OZFbGYA4hcFANU8t7pD92h7n3FfuR4WnkC7kEyUvAF5gxfvyV1Su8ypzqzZBdLxY1S0B
         7xFoYhTSt61K5WeId1G4XxKHZBl7q2uCUui/Hv3+pQfqzJuNndNSnBmMZrP4PiKUbwy1
         3W+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WzHQP2pHDPf8b/aNOBFwrKe9Fe+VkqE7R9SoZi1QpZg=;
        fh=93KZDjIabqBFgbSC1rIfg2OL9H9vBcRlzFHSjWBl5As=;
        b=A49Op67QukySSwMjED3hnwFV6MCmoxp/d46/gbmfvuiJBRwB9EuaVdwdDYl3VvoKNL
         lZiDiCAgJC21xoIib/g0frj2ZTSR7fsv6vyoErOqk29JBz25ZTUEw4eqeO9UH0o6mNAO
         nqwjJFkA5lBTOTHW7ngcx7WeZGMSBfF89FjybRsj8LYHLOe4xyp2B7tGBno+6OUMSTFK
         W0A2Xy19Pubiv7pvTcjYD2I72XNaPaR4vEDLuqIFyiJsow1vyqoyzhl4QYBrgexNKXNo
         hrhtHBxqFD6LA6QW8ydCe9j5Fk/XVN9jHRBF6iuIQaKsESHV432evBFpxYq47Xt2stFi
         qwSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774280332; x=1774885132; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzHQP2pHDPf8b/aNOBFwrKe9Fe+VkqE7R9SoZi1QpZg=;
        b=UihAU7mheCqvn3V6hdiD7tzqtZRPQBW5NFRsbUXs5HYNSdgR/62w8j5MzJf1fe5j8X
         8ls1w3gQlpxiN7mED0L6O51EcKeEO28oUMQYC10UaVnjFjGKOvTrN2fMD/euPqDr8JqY
         8m1VmE17ZDkg53vWbOqw3fBn3QQVDPul4Q8VkTz9POseBr8j6YCgbyYxyAJ8UXe5Yz4X
         T5NoHyWZXkuGkbT8+LJpoH+fflzlEBsJYFFLpnu12JKadwMjRQvp3WVAXiT1KLuDROLD
         R41fdjeGlBxYsYAHahLpPw/CxJ8qWYtM7BhS9dDm80A1R2SFbSyjE6GR4Zrm4xgIhHAd
         Z9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280332; x=1774885132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WzHQP2pHDPf8b/aNOBFwrKe9Fe+VkqE7R9SoZi1QpZg=;
        b=NOvWRlpHyuEUhAhrslHwMu78iukRCtIUERW9XBBRfhS1vOo0ZX+gm6q5nNtDSyDV4t
         wWfbGgjn9DsYb9Tf1lQXQ6XCTkDkFjDUfXC+d7iwN0p8bXPA0kjHjg1bV6/bEVonE1DD
         ysrZk1jogLA+v0RdtM3X987KdWmTqMrYK+1ZtYdthAVo0QDCvaukDYpNlwljAjrFarj1
         aM8qpt/wSCoR47T6J8JMVkn0bPfbazc/SokHVJxT7gccV2p0g7slJHqoFxctQOqshx8q
         2dKfRUUONCEcBE8DLvpp9i6W8a0jrOZwhtaG9/xFUZ2XmFE62WB77Lkcjk0gtBx8I+q7
         kZeg==
X-Forwarded-Encrypted: i=1; AJvYcCXCbex+x2uZ42QJ6GBwPB8oscxx6M0kupT8sSy91vlEQRzOf6GyXto7+wJrqJ8uOoAkfK1h@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1zf91m42NfwuNpLWQb0G/IMGX/QMzdyUCBwYat16dWqD191m3
	NwEdBNl+CBeuHcM7PZNurYg7yLU9lW3q1HgSxWZBrKVTIZGU++WWVW/z984mZ7IiQRfDZqhgUIt
	NGoF+8pQqVYAwvJ+rieiBfdIbhOSG3wc=
X-Gm-Gg: ATEYQzwJkCybFpTn947sRVKidsU+jCw8o+YtIPN7YBvmsp3YxmM+kz6TKpzaKNYwlCf
	8+JMAeEMotWE8dtM3NXop1pr6ajvWyMDV6LW33De+03AppeOh0QM4lY4GKAmsKWFDMJQJN9RbxA
	Ce16FthMfVaqSplkMfeA8hHYQOkOesKTz1uLrgDD0Pkpl/BWTYgO+5KpiQlQuumzWW+/zMp0MK0
	ULewFynVbJSsz2nEQ0yQVbLU/ugEIGJ2BDGwMDS6+DSLyJ0r8Kvh3Ar6R7esRIF+lg+tzkT7Bj3
	1ZPQtc22Z/ughqvrCm5runbyBhTYmiRCMkD4+C21/gcAFaMxIXbnVpXuXK/mwU47snxqgKf3ES1
	xdtrvAp7ZaH4DPh40uElaP+vcbxaRPfQsvrf5JG5BuT8Sxa3p7X7eK72Mz6n2k6J1FQ==
X-Received: by 2002:a0c:f101:0:b0:89a:6f04:ac85 with SMTP id
 6a1803df08f44-89c85a9043fmr158483166d6.54.1774280332010; Mon, 23 Mar 2026
 08:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603180118.ClDWNtId-lkp@intel.com> <b859bfa1-7844-4b23-91a4-bbd526ffc19b@samba.org>
 <CAH2r5mvvjWtJza+9YrLYvneysyEQa5rENhTYiFTAwrE+KhOy8Q@mail.gmail.com>
 <CAKYAXd_yLYLD5SsRUZy8d6u7vknTPuN8Cbe11HJt0Eq6bLzBBw@mail.gmail.com> <69c54f80-dff1-4c02-af97-08799fe59b94@samba.org>
In-Reply-To: <69c54f80-dff1-4c02-af97-08799fe59b94@samba.org>
From: Steve French <smfrench@gmail.com>
Date: Mon, 23 Mar 2026 10:38:40 -0500
X-Gm-Features: AQROBzB9SG6sPgo5T8QjqxwVih72HS4tyEMWLFluaBLXGLnuGbVnDzT8w0i3o6U
Message-ID: <CAH2r5msADO+SbgJxwX0vNU0keHb5WScqOmrb+uszmG2uZt9Qrw@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 11/12] fs/smb/server/smb2pdu.c:5723:3:
 warning: variable 'pntsd' is uninitialized when used here
To: Stefan Metzmacher <metze@samba.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Asim Viladi Oglu Manizada <manizada@pm.me>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Steve French <stfrench@microsoft.com>, 
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I agree - looks like a bug.  Should be setting the declaration to null

   struct smb_ntsd *pntsd =3D NULL;

since the initialization of ptsd is in an if clause, you could end up
doing kfree of uninitialized pntsd pointer on line 5801

On Mon, Mar 23, 2026 at 9:52=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 23.03.26 um 15:43 schrieb Namjae Jeon:
> > On Mon, Mar 23, 2026 at 10:22=E2=80=AFPM Steve French <smfrench@gmail.c=
om> wrote:
> >>
> >> looks like a simple fix to initialize it to null at declaration, right=
?
> > It seems this test was performed on an outdated version. The current
> > ksmbd-for-next already includes the updated one, so we don't need to
> > check it.
>
> For it still happens with the current state:
>
> 1ce4e48216b84385319da308f2262eb11ee7e459
> (smfrench-smb3-kernel/ksmbd-for-next) smb: smbdirect: fix inverted compar=
ison operator in negotiation log message
>
> And there it's likely:
>
> 6a0795e46296589d8eba6c194586e9e65974d73f
> ksmbd: fix OOB write in QUERY_INFO for compound requests
>
> With setting it to NULL the smatch warning goes away.
>
> metze



--=20
Thanks,

Steve
