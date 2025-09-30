Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4551F30146C
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 12:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759236606; cv=none; b=klpkkc3Iu5btN08I7hEqt6QRbOY91SF3wwvSOarJ5VIyebLEPZk4mx2+DmnO8r0leK+iJjX5fQMVDuCc7SRlkGkbepEDTW+WW3/u4Wmczf/2ewpuBBjeRWZu478PBNzptrSeO928sr7/5OFSJCAYnoz8BT6GNczJ3kEW30X8QaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759236606; c=relaxed/simple;
	bh=CXTHR3+ruv4b2NmSi2QyXZZoVB+RVVvtqzPGciNVlhQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=sete1dNqQuRTk0lSRW5efrWv5HfUp8eVffaf0+mEbTuRhryljUevwVfVQFao3MaxigJh5SSvEp2dxtzEwObaOvsuQ3aHisKUmYz080O/12QDmmZoj8kQTf59rxtPjbYwvPe/9VtxvJNE3VVLwS4PfeWw1HCmUsrptXhDDXRrVdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3KabmSU; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3KabmSU"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-59eb88955d8so2473931137.2
        for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 05:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759236602; x=1759841402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DIF8xxMKs45jgicXUY8+fOYkrHvhQ+64uTG3AYNzDU=;
        b=m3KabmSUZDO1cXgxIjFUNjEQqWRhK9/axPFBHMb98fOiJpVdG6hnQen0JPga3Z7IcM
         khuue8pqAPcgnHoqoRTV4inXBBxtv7VoXfnkAU0Xq/1JibdQiJ8NujLp6itjvLwTs0D+
         /yZPr+L8SjcjxizhI3j7G3RpW8iqrlvd5dc/sdFBlK45SUTdvfEECcrsE4MxtDigJTVR
         rOugUYoTnnQXMYUtHIKPMgLB1GFRzNY7caR7eUenoSymtp2k8113T74xSkRqJfMLf6g5
         2dPVw5bgaPKMMGHzo4c/+w5npwziT3PmPT85OxjFnmE4213iloaLcpy+NPpicOWhibcg
         Wmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759236602; x=1759841402;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/DIF8xxMKs45jgicXUY8+fOYkrHvhQ+64uTG3AYNzDU=;
        b=ukwEbU8BGnMgR2PbhmGI6r+0h+GgPDcop+I0+3AxgX1unQl4RUH/8tkI3JQk4pIczt
         N968EWqdfnizDXH1Ye2/grzZexK2dUBedDafod9YkjzpbV/Z7Be9wzdZ3nrwh6wtVmmB
         U/JMylHSF/ZRny7FyqZPYCn4u38hPdfJuNxV/f5vH4T6bnpoXWAD2waarYPsispG06LB
         pKsjtY7j98cljxsAlcXg8sYMvDVIht32OWEv+oPODsmrzt6fsa7vaCsFETKOcf32OJSi
         ygwTGmIziO0ZzSWpIKHzRcIY/H+e2AW6pKItf5UU09QUNuYFE5GDw476tVMbKVRZQP5R
         UVqw==
X-Forwarded-Encrypted: i=1; AJvYcCVkQxnagosWGJUsnfNnoA/Nymla5FqHDQ3uxscgLjtXS3qKUrZgF1jjotntsyakVEX8UvB8@lists.linux.dev
X-Gm-Message-State: AOJu0Yy67ZBT5Uo9vDgCbXDm8qgnMFM/RJzBxFZc1AwgzZ25ausKvngC
	KXX4UmzmIsF0Ba5a9IYwTANw9x4HfxkwSpgk5TUaIcLFfMzdBLQE2xq0
X-Gm-Gg: ASbGnctNhHYEoqm4lGuGQ5s/yeVJmuRX0N7TxrzaQJD+khKzO4NalX1nFKZpDxy6W+k
	ffN5Y10lnjEcdwXNK+gfTSwrvljDBSZ2vbesDQst+E5ot4ALQs0lkGIGliWHNwSKc/Fh35RhmmM
	59oi2ORrGkGO/Wc75cjazzrscgEtZwMbvMaoRm+KIaVRnYBi6kxotWeza/hVBCW2Fa6023ejnd+
	5R+IAnF8NXHNbtUW6AlwANeBwcjmK2laUEymqANGQMqLgD06rJDZmRTzVJoc6eihPGCShOAoy5Q
	tqjBs4zNmp+GZgyKDdVEwFXhU49lA5paIXCGFUR+TxbufVMIqkqnEQT04xOkZwwHFsPk9ccJgyF
	tyA0XhwOudD3xu/cz3FoA/LPsKwzCraCpLbe0B7wCUxQmQ1tvuKIfg9BHQwQ4+64Q1VBh4llIld
	b2SsKH8fbI/9PL71MwWIWnwGUUntnVtfgvHDlROls=
X-Google-Smtp-Source: AGHT+IF3jXqpSXTJaRkGEMK7WKJd7LDbG8wy3D5EeY7LmVpdZLbKNSI6KpFy0rL2Q30+2atZz2NZEA==
X-Received: by 2002:a05:6102:3906:b0:4fb:f6ea:cf88 with SMTP id ada2fe7eead31-5acc6240067mr7922871137.10.1759236601986;
        Tue, 30 Sep 2025 05:50:01 -0700 (PDT)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id ada2fe7eead31-5ae389dd1fesm4532961137.12.2025.09.30.05.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:50:01 -0700 (PDT)
Date: Tue, 30 Sep 2025 08:50:00 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Sidharth Seela <sidharthseela@gmail.com>, 
 antonio@openvpn.net, 
 sd@queasysnail.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemdebruijn.kernel@gmail.com, 
 kernelxing@tencent.com, 
 nathan@kernel.org, 
 nick.desaulniers+lkml@gmail.com, 
 morbo@google.com, 
 justinstitt@google.com
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 david.hunter.linux@gmail.com, 
 Sidharth Seela <sidharthseela@gmail.com>
Message-ID: <willemdebruijn.kernel.30a447f86eaaa@gmail.com>
In-Reply-To: <20250930120028.390405-1-sidharthseela@gmail.com>
References: <20250930120028.390405-1-sidharthseela@gmail.com>
Subject: Re: [PATCH net v5] selftest:net: Fix uninit return values
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Since it's now only to ovpn, better prefix, which matches other
patches in that directory, is "selftest/net/ovpn:"

Btw, review the posting rules. Leave 24 hours between reposts:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html


Sidharth Seela wrote:
> Fix functions that return undefined values. These issues were caught by
> running clang using LLVM=1 option.
> 
> Clang warnings are as follows:
> ovpn-cli.c:1587:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>  1587 |         if (!sock) {
>       |             ^~~~~
> ovpn-cli.c:1635:9: note: uninitialized use occurs here
>  1635 |         return ret;
>       |                ^~~
> ovpn-cli.c:1587:2: note: remove the 'if' if its condition is always false
>  1587 |         if (!sock) {
>       |         ^~~~~~~~~~~~
>  1588 |                 fprintf(stderr, "cannot allocate netlink socket\n");
>       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1589 |                 goto err_free;
>       |                 ~~~~~~~~~~~~~~
>  1590 |         }
>       |         ~
> ovpn-cli.c:1584:15: note: initialize the variable 'ret' to silence this warning
>  1584 |         int mcid, ret;
>       |                      ^
>       |                       = 0
> ovpn-cli.c:2107:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
>  2107 |         case CMD_INVALID:
>       |              ^~~~~~~~~~~
> ovpn-cli.c:2111:9: note: uninitialized use occurs here
>  2111 |         return ret;
>       |                ^~~
> ovpn-cli.c:1939:12: note: initialize the variable 'ret' to silence this warning
>  1939 |         int n, ret;
>       |                   ^
>       |
> 
> Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
> ovpn module")

stray line

> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
> ---
> 
> v5:
> 	- Assign -ENOMEM to ret inside if block.
> 	- Assign -EINVAL to ret inside case block.
> v4:
> 	- Move changelog below sign-off.
> 	- Remove double-hyphens in commit description.
> v3:
> 	- Use prefix net.
> 	- Remove so_txtime fix as default case calls error().
> 	- Changelog before sign-off.
> 	- Three dashes after sign-off
> v2:
> 	- Use subsystem name "net".
> 	- Add fixes tags.
> 	- Remove txtimestamp fix as default case calls error.
> 	- Assign constant error string instead of NULL.
> 
> diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
> index 9201f2905f2c..8d0f2f61923c 100644
> --- a/tools/testing/selftests/net/ovpn/ovpn-cli.c
> +++ b/tools/testing/selftests/net/ovpn/ovpn-cli.c
> @@ -1586,6 +1586,7 @@ static int ovpn_listen_mcast(void)
>  	sock = nl_socket_alloc();
>  	if (!sock) {
>  		fprintf(stderr, "cannot allocate netlink socket\n");
> +		ret = -ENOMEM;
>  		goto err_free;
>  	}
>  
> @@ -2105,6 +2106,7 @@ static int ovpn_run_cmd(struct ovpn_ctx *ovpn)
>  		ret = ovpn_listen_mcast();
>  		break;
>  	case CMD_INVALID:
> +		ret = -EINVAL;
>  		break;
>  	}
>  
> -- 
> 2.47.3
> 


