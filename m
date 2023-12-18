Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60211DFE1
	for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MXSO86Fu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3365f1326e4so2104497f8f.1
        for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 08:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702917163; x=1703521963; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxF72wKyjSEZjuqzTvuY0Vstw6URgB5M3BZ+UT5BCpI=;
        b=MXSO86Fubcg2u1gH2asI4hIqDBn78EHtX7SnSxEp8xMd4/ytytN0qiW3tvixIX2+Ds
         YdKGTQunBXu12+t1Yye+SRgpLj2pwzntEbVH3YNhW2DygJ0wUvND80yJtb35TlQWH4Ix
         IlQuzGt+dBK550RPXsT7srES7MLIzenDPKgKTK6WgpyQb5p9o0ceh9Arvco42Ekgo3Cw
         aIG1NkB2D2razgwRE4rjNZEkPX7oxZwQVK3qa5PXQQ0Q5Vv7BJlHlm3iOGMYErnNhk7S
         OtC4NXMAW+ATeDrAkjsC3nC2t3CvaP+8jcKVRxTEiG0VDseHbaa5tHS8o+fzCPNRDpfG
         FDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702917163; x=1703521963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxF72wKyjSEZjuqzTvuY0Vstw6URgB5M3BZ+UT5BCpI=;
        b=Jxd87mD+LSJLHJkOLuBioAGRMdGIjR8EAcnic7sJNJIT94rHS/9RWGM153KgZFDgYS
         a/4/4bS4Z6T5B92q0Af0vYbqi701Wv2NI0uavp6bpHsow33s/njGt4P8Gv2oOfcmqlmH
         ojqgGYi1bIz3o8BXFTgV5+Pqo524NDLtI6P4HgfgP4WsKzNV8YzbdoFACz7WlYhgwrZ3
         o0TueJFlN27ayyXdrqHDg+CBWzciUL7z4S5+KenNVi8tnVe0leU4lyPyeHzclV+RdFKb
         Lxq7oWHJqfAygrY6kbnVWzBGp5cyrPH8L8gPDbNlRKV/iVCZPPx2CJc5Ro8Rxrry333Z
         xh7Q==
X-Gm-Message-State: AOJu0Yyis+GdzJQY38BpWj1uedGfmevugxumElLlXd/ttgcBzdwCh7yB
	KocHK+3BLhah3T4hiDlV8gj4ph7v+gvU1LFgYbKzfw==
X-Google-Smtp-Source: AGHT+IHGfFW6R6JOaRG0q4/dC5NXDsnHxuGOKtVw5DDYC+yH+BCIjfLy0MnSQI2L3kNO0XZL8vOkfR4p88ZhQAopGz4=
X-Received: by 2002:a5d:4cd2:0:b0:336:42b9:6a75 with SMTP id
 c18-20020a5d4cd2000000b0033642b96a75mr4813068wrt.31.1702917162922; Mon, 18
 Dec 2023 08:32:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231217-i40e-comma-v1-1-85c075eff237@kernel.org>
In-Reply-To: <20231217-i40e-comma-v1-1-85c075eff237@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Dec 2023 08:32:28 -0800
Message-ID: <CAKwvOd=ZKV6KsgX0UxBX4Y89YEgpry00jG6K6qSjodwY3DLAzA@mail.gmail.com>
Subject: Re: [PATCH iwl-next] i40e: Avoid unnecessary use of comma operator
To: Simon Horman <horms@kernel.org>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 17, 2023 at 1:45=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> Although it does not seem to have any untoward side-effects,
> the use of ';' to separate to assignments seems more appropriate than ','=
.
>
> Flagged by clang-17 -Wcomma

Yikes! This kind of example is why I hate the comma operator!

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

(Is -Wcomma enabled by -Wall?)

Is there a fixes tag we can add?

>
> No functional change intended.
> Compile tested only.
>
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/ethernet/intel/i40e/i40e_ethtool.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c b/drivers/net=
/ethernet/intel/i40e/i40e_ethtool.c
> index 812d04747bd0..f542f2671957 100644
> --- a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
> +++ b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
> @@ -1917,7 +1917,7 @@ int i40e_get_eeprom(struct net_device *netdev,
>                         len =3D eeprom->len - (I40E_NVM_SECTOR_SIZE * i);
>                         last =3D true;
>                 }
> -               offset =3D eeprom->offset + (I40E_NVM_SECTOR_SIZE * i),
> +               offset =3D eeprom->offset + (I40E_NVM_SECTOR_SIZE * i);
>                 ret_val =3D i40e_aq_read_nvm(hw, 0x0, offset, len,
>                                 (u8 *)eeprom_buff + (I40E_NVM_SECTOR_SIZE=
 * i),
>                                 last, NULL);
>
>


--=20
Thanks,
~Nick Desaulniers
