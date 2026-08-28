Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7222BE03C
	for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 18:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942916; cv=none; b=Y/gColYg0g/ILPUp73qLbugaIDQcw1dTW2dmOPCLYY8pJ0WNmHCJShPjKOXeZfHLzRwyr4YRGcjtcyjRjmbT36EsCkpYzeFZNTo2K0zI6LCHwVKcUi4HJYoewoe0fJEo9YmyBjSHbPmxCA/dRoZz4Ps3e5g2gd7WK9f7Ui9eXys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942916; c=relaxed/simple;
	bh=pqZV16Ap6Nr5H5RNGeeBW3ozFJ8asN8WYSShabIew/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=t+BV/pXFDmTYzBRx3Y1+ZSKOrz88Puh2uHDIAnmsXlBV3Zukigk938J0caqqmoxwoQ7itZmla1XuC8YYOa0sFyOnQpGMs+hCzOoiMaEGnx1/31KGElylfDSlJy4uy2A2KGceQ8pPoW5mkG8KE276Pbu9W3hYnAZZ+Efkuw5L1to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=E7DCej3G; arc=none smtp.client-ip=209.85.222.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="E7DCej3G"
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93900ed2925so105822085a.0
        for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 11:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942914; x=1788547714;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DUU4Ka07ZB+tBwX7A82KkoppEXicqFDcW9O91VkJ6cg=;
        b=Jsbszdu4l/i20cvH6Ngersg8hyA+qhVRm+6HTqH8MiwpQnsQWA4FhV7YTasl4hP/tN
         INbSx85tTcrLvNMSTOYjyhcWMyYJGXwaP6A5rbb7QEu2Qx2lSPaoPK/3RbYrBg6u36yW
         PvlAUm4E9cbH+lamBppoE4ohX+/fYp31xsmhUA8nGjfjFydhzu95JW6DfLeRwZzTeFcv
         WtGxdj7Abs5JBzRbiDqlGFb/b2tiZmIgVN0mJMoOvALR1DoAd7yU2TYxDCtu1nLmZGXv
         zIBXZZiK1Xuxp8FuDNNPI7YyHMteXFrOpUFHsaDvpELs/M2vONLwCeV2AoS8ULNTuYg8
         d0VQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXEs4LNegRofLAJ91pLilr7bzYDo5+0/zoQBtqBZuDoNEvzHcsX4OjWClwlqaCujhQHSG/@lists.linux.dev
X-Gm-Message-State: AFuF++ncUy9clMkY7ZbDJlp4ulVeoJ0nj58ZWueKP3/tv6hm9ORcedbX
	PBDXVJxb41TnYPFt8S8IIsx8rRx2kci0B+bGTK9spXXbOGz+cipT3tjz/gFmbxA/77lHOL6FEmk
	HqPwj28T6lLS8uxIt+YQdnI1bSYJdz7OBl79Jma+PSJSf+Q/wC/z5nBVfgSIjZWxbRul76vXQv3
	CZTMU8bcwUQXcqM68kYDpHachhZO9q37UlZbcjgyxoe4Up2LK+Lj2W/XNzLON5c99PgLIbpFugq
	KWUpFWJ
X-Gm-Gg: AR+sD11t3/7yQCwGchNLNKEFcQJediamnZgxNajfXnP+FQjZBkNLiwH8kkwx6/g/9P5
	dBnbxO4N51kA985pta9ftl3W5X+H6GCa/YP2hwQQ/Xam3l3nU1UwF300fzko4M+80bxrsShcBI6
	dNvRt598XNRn8m0SBYfafKFLTyIARWU+Ok3h5JgKF/4BCmyaI3MKMDmutX1QC6vq78Kcb0cHy80
	rsfTrC4mnfoCvTTb/WqTYN+zF2kJrIuoYVKoipdiv+oDHom6x0XPkJu1pxmzrRR2D2GPMf+5ZLO
	X/GetG49hRDVq0crj0EI7+OMMn8i7dLWK9igk8ZQDLzClmWlmz+1vKfO36W5zrZywuhTk3HBB2d
	RTIN5x69SVllnjmTkzeOtuWT8sSDFgsOHj7VWYtW3Hj2MBsIN44DaNFIhdnleFNBA/tm+Bda8mf
	oXI3Zx4MU1EO1Jv7RpIPTMVoFMgMMP8IFlIko=
X-Received: by 2002:a05:620a:6f8d:10b0:939:93f:3b41 with SMTP id af79cd13be357-93913792889mr867490185a.16.1787942913695;
        Fri, 28 Aug 2026 11:48:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-939175ce904sm27041285a.6.2026.08.28.11.48.33
        for <llvm@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Aug 2026 11:48:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c25148e933eso92771866b.0
        for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 11:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787942912; x=1788547712; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUU4Ka07ZB+tBwX7A82KkoppEXicqFDcW9O91VkJ6cg=;
        b=E7DCej3GS26gJ40+Bt3jjmcyQu2Tijn1fQAPXQFFaMEF+6TfX0f4yD8uQIT7ZFMk+0
         URJjYsDk72zCKS20OIS6aMsRZBlhHFGO3eMVUMOhSCC3H7F0m9h5rmsyu4345D3OYSI5
         bL0/j63IL3oR2LCJcHi2jt2dkKn0NrvsnN118=
X-Forwarded-Encrypted: i=1; AHgh+RoJpJ8OM58ENDoPssf5GnXLRa6IzwpRhqfV1ZVprfdhyJeW6CleeK8d74s5IfAGIhsTv22v@lists.linux.dev
X-Received: by 2002:a17:907:c19:b0:c12:9b93:61fd with SMTP id a640c23a62f3a-c2556c2bea8mr613710866b.6.1787942912079;
        Fri, 28 Aug 2026 11:48:32 -0700 (PDT)
X-Received: by 2002:a17:907:c19:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c2556c2bea8mr613707266b.6.1787942911597; Fri, 28 Aug 2026
 11:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827185700.2157164-1-joe@dama.to> <CACKFLikJiCdjej4ezF=U16Leef3oAjSZGQAyetRnF=nLRvUfZA@mail.gmail.com>
 <apDLEbEu1PLTGU+f@devvm20253.cco0.facebook.com> <CACKFLinQHs80MQbn8o8Fw3Qg=1DJ+7ZMevPkDzxnDr+mNX=SfQ@mail.gmail.com>
 <apD6fwM7beKVGz++@devvm20253.cco0.facebook.com>
In-Reply-To: <apD6fwM7beKVGz++@devvm20253.cco0.facebook.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Fri, 28 Aug 2026 11:48:18 -0700
X-Gm-Features: AcwNN1Wl_6g54xLcUPukSItqlIQfXtWutvlki53Ssxl6yZZ6R3MLge9n8f_kmB8
Message-ID: <CACKFLi=BokNTb5Omc9q5_ojp0-9YG60bft+4eZLx6rOvfXvqkQ@mail.gmail.com>
Subject: Re: [PATCH net v3] bnxt_en: Bound SW TPA IDs to prevent crashes
To: Joe Damato <joe@dama.to>, Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Colin Winegarden <colin.winegarden@broadcom.com>, 
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>, 
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, horms@kernel.org, 
	linux-kernel@vger.kernel.org, raphaelcf@meta.com, stable@vger.kernel.org, 
	llvm@lists.linux.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002b6bf9065a1fe6b3"

--0000000000002b6bf9065a1fe6b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 8:03=E2=80=AFPM Joe Damato <joe@dama.to> wrote:

> @@ -3832,6 +3835,10 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
>
>         bp->max_tpa =3D MAX_TPA;
>         if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS) {
> +               /* TPA is not supported at all, so there is nothing to
> +                * allocate. BNXT_SUPPORTS_TPA() is false in this case an=
d
> +                * neither LRO nor HW GRO can be enabled.
> +                */
>                 if (!bp->max_tpa_v2)
>                         return 0;
>                 bp->max_tpa =3D min_t(u16, bp->max_tpa_v2, MAX_TPA_P5);
> @@ -3839,6 +3846,7 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
>                 if (bp->max_tpa <=3D 32 && BNXT_CHIP_P5(bp) && !BNXT_NPAR=
(bp))
>                         bp->max_tpa =3D MAX_TPA_P5;
>         }
> +       bp->max_tpa_roundup_size =3D roundup_pow_of_two(bp->max_tpa);
>
This looks good to me.  Thanks.

--0000000000002b6bf9065a1fe6b3
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
DPVtLUtep/P3evQuAtTQRaKedjamBcUpJ7qUhBuv/Z07LlLIlB/vfNSPWe1V+njTezc8m3VfvNEC
qEpXasPSfDgfcuUhcPR+7++oUDaTt9iqGFOjwiURxx08pL6ogSuiT41O4Xu7msabnUE6RY0O0xR5
5UGwbpC1QSmnBq7TAy8oQg/nNw4vowEh3S2lmjdHCOdR270Ygd7jet8WQKa5ia4ZK4QdkS8+5uLt
rMMRyM3QurndiZZJBipjPvEWJR/+jod8867f3n0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUJbO/Fi7RhZHYmATVQf6NlAH2
qUcwDQYJKoZIhvcNAQELBQADggIBABcLQEF8mPE9o6GHJd52vmHFsKsf8vRmdMEouFxrW+GhXXzg
2/AqqhXeeFZki82D6/5VAPkeVcgDeGZ43Bv89GHnjh/Vv0iCUGHgClZezpWdKCAXkn698xoh1+Wx
K/c/SHMqGWfBSVm1ygKAWkmzJLF/rd4vUE0pjvZVBpNSVkjXgc80dTZcs7OvoFnt14UgvjuYe+Ia
H/ux6819kbi0Tmmj5LwSZW8GXw3zcPmAyEYc0ZDCZk9QckL5yPzMlTAsy0Q+NMVpJ8onLj/mHgTk
Ev8zt1OUE8MlXZj2+wgVY+az2T8rGmqRU2iOzRlJnc86qVwuwjL9AA9v4R13Yt8zYyA7jL0NiBNP
WaOSajKBB5Z/4ZVtcvOMILD1+G+CVZX7GUWERT9NRXw/SyIEMU59lFbuvy4zxe3+RbOleCgp3pze
q8HE2p9rkOJT3MkCNLxe+ij4RytIvPQXACsZeLdfTDUnjeXCDDJ9KugVhuqMelAZc4NissPz8FOn
2NK++r5/QamlFqYRhsFxSBIvhkh2Q/hD3/zy4j17Yf/FUje5uyg03FblSBOk2WYpRpXEuCpyn5pb
bYVIzfhQJgwGfO+L8BAeZIFjO1QL3s/zzn+RBlTl4wdDzh8L9eS+QEDhMcSsqb4fFRDbsoVuRjpx
R5MunSUzk4GcmmM19m7oHhPGeKwIMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCB4aybN
YqMTJHPl27qaF7j2AABSTCRCRhakXOlEXxCHUTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjA4MjgxODQ4MzJaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCGf4QFUYcDynAuV7czGIxC40kcryDgid72x0Ne3aYa
TtuZom942ApepzZrxGan+OA6ho9C9aPTAadytUrRtao0VeodCUa/q5fk7OHGwwfsAoIEnHQAWEIM
kavVvi4OQOr2mMkQ13hkP1C11c7x0hxvEKIA1bK0go67B4vR/45WAIUpcViB9F6d4MK3GwP4aEMC
CSNAFCBKjQ7/RR36+J04COakh1aGRZZlIIALGlWLd2EImLuHbl1sLyj2XYNJxd9SanUaKVI9nDCg
fTLNwlBjVWBBxK4ly7KFNtqHUdPhg8I2lMffc8dUTiqoKQL9wqMXNZUNm0ycAOy8APKUCXRh
--0000000000002b6bf9065a1fe6b3--
