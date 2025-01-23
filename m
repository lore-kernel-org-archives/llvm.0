Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDFF2F3B
	for <llvm@lists.linux.dev>; Thu, 23 Jan 2025 06:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737613125; cv=none; b=uqlAu8LHYz1ynfBZVO+X5rTiOJRnmdo/6fvnJxkq+lrAQIMB00vLJNi5GvG6z+Yjvjkdhxl6bGTwYWfcl7P2czLb8zsQm6CabhNR0yRtoaNpj8lXM/XIlEgxr7egm9Rq5bHHkHPGnU6jBTjxhx8VWrj7N17KuFHwYFbqOtVpwb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737613125; c=relaxed/simple;
	bh=MoJKo2TD6DB0+hKk7XbyvBjNCR9ExSuHVb/uimVpbFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOVq2LrGp8tssa9LapCDrmhK4GVfxR5vLeNxGZGAsrvaaH4krTh0Vp+eFcY45qv72ood6ez8JPN07mWvyUqnPix0RnSdKN8mTQqQkMkImbECn2bxflAvP3Clnn1ylsM5FN2z2n7qZxIMROc2kUisf5KAuElhmShmTijOwqDhFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkCgV4Ae; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkCgV4Ae"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436a39e4891so3041605e9.1
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 22:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737613122; x=1738217922; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TqaS9GGZm23RZfZAEY9Vl7ozP598AZjc6tLzI298NqM=;
        b=KkCgV4AeFCM4Ql0aZ2FyxDPkF5gtEXUFyacrx1aRmscT4/tkIO+dB3TgWALQa/LVsz
         A2owJhhhq/KjV+CUgi6b+hb83a1maLTzVNX8x5mPyymJuHigABLPzGB9IugY8863xfD2
         +0fuH8byH9twR9RXPvdmRwS5lZ85LHjSBLRVTT2fK6Vsczo97+90kvbbU13upmomZDnG
         p0swqQSkyFWdTwJpCTDKrojYxPuG0EfMxm8lhWKVA41tYfzFF2Duis7df83qVR7nE1EI
         ge67EpGfLWgPhK7ffi9RORoqIkkKemX3qqU6ttiHnBqrhmujgKGgLSNrcKNaSOojOO4Q
         jAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737613122; x=1738217922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqaS9GGZm23RZfZAEY9Vl7ozP598AZjc6tLzI298NqM=;
        b=BoWiNSW1XkJIuNcvAwVRodRyEzAyvOyX/nCwtnEjaaZfMWj8K5XbrtnRXUWiOr5Zy+
         hFzdBzT2ugxiUVPUKjxChq8Y3rqwjHkRZvk1aDHsnZX7HL5oYx7tYSJMnbOggfyKuC6R
         R8TGv41qWbkGqUaWslrmBKsPhMC2jASQPBpv5z1CNrsEXz3GFpDjQM8QzqPEI3DU9SDI
         EoNO3ejGslhfFVsjt39ngaoXVkaQgaHBZKRg7pcx3uULyFPRpb3+8AK1M+pxreqoUSUj
         XzjynSiCqX8zu47TqcPPH34vvrVen9ZTbDMfjTNE9VU8Wkx1NNeWaGNeeK9wQmHpGK9O
         b1gA==
X-Forwarded-Encrypted: i=1; AJvYcCVEFbTfsp6j0h9SqNx/yRxPyHJGGL8nf7ytAOyHUYyiJuGdUq+lW/7hT3563u2pUWbC5qPx@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb5s5NlYS8fFFeG5ClfAefe9dpjQDGc40xRE96lr1QWkzqZz46
	dsMi2VcXmjOc5aUDtV1LVmBdKWYqQf5hSiBb2d4jZCkh2c4DM6Pt
X-Gm-Gg: ASbGncuPCo68wjJ3Iyu3221G3y7XMHtio7rheeYwbGoosBMIhx3Z0Wn2/Pac1Tbc9Lz
	VK+Cu8jvQ8F7uFJH6/MHDtfXwWEBaoUoYXUnz5QNRcZsEuNte8dIHMiZCGM6XGKyNILDQlhK+Oo
	Gwl4GxmsioVJUn/NjznbRDocKix1ECkTgcr/K37N/W6Fitj2N/hMXA5sIt9kfV4rkIbhb1EmRTR
	mRTMd1m8d4a7XoF3A+D6Glm7AGbaLSHpUC57uWv1FLDBmtCsmMZvBVrF0A0gemMNlpEiUS9DP6V
	NfRep4cJ0OA15Xs6mcQMyw==
X-Google-Smtp-Source: AGHT+IGccmOYDrSy3PczETUNF3V7Uq9oBwl4zX4UB0O8TKRibKqCfK+yBMEaF63Il+3/ZINyNgZK/w==
X-Received: by 2002:a05:600c:218b:b0:436:e751:e417 with SMTP id 5b1f17b1804b1-43891919404mr233512265e9.7.1737613121882;
        Wed, 22 Jan 2025 22:18:41 -0800 (PST)
Received: from [10.80.1.87] ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31c8764sm49307655e9.38.2025.01.22.22.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 22:18:41 -0800 (PST)
Message-ID: <c2f199f8-c9c9-4184-92cf-b179e162ece6@gmail.com>
Date: Thu, 23 Jan 2025 08:18:37 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net/mlx5e: add missing cpu_to_node to kvzalloc_node
 in mlx5e_open_xdpredirect_sq
To: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, saeedm@nvidia.com, tariqt@nvidia.com, leon@kernel.org,
 andrew+netdev@lunn.ch, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, witu@nvidia.com, parav@nvidia.com
References: <20250123000407.3464715-1-sdf@fomichev.me>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20250123000407.3464715-1-sdf@fomichev.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/01/2025 2:04, Stanislav Fomichev wrote:
> kvzalloc_node is not doing a runtime check on the node argument
> (__alloc_pages_node_noprof does have a VM_BUG_ON, but it expands to
> nothing on !CONFIG_DEBUG_VM builds), so doing any ethtool/netlink
> operation that calls mlx5e_open on a CPU that's larger that MAX_NUMNODES
> triggers OOB access and panic (see the trace below).
> 
> Add missing cpu_to_node call to convert cpu id to node id.
> 
> [  165.427394] mlx5_core 0000:5c:00.0 beth1: Link up
> [  166.479327] BUG: unable to handle page fault for address: 0000000800000010
> [  166.494592] #PF: supervisor read access in kernel mode
> [  166.505995] #PF: error_code(0x0000) - not-present page
> ...
> [  166.816958] Call Trace:
> [  166.822380]  <TASK>
> [  166.827034]  ? __die_body+0x64/0xb0
> [  166.834774]  ? page_fault_oops+0x2cd/0x3f0
> [  166.843862]  ? exc_page_fault+0x63/0x130
> [  166.852564]  ? asm_exc_page_fault+0x22/0x30
> [  166.861843]  ? __kvmalloc_node_noprof+0x43/0xd0
> [  166.871897]  ? get_partial_node+0x1c/0x320
> [  166.880983]  ? deactivate_slab+0x269/0x2b0
> [  166.890069]  ___slab_alloc+0x521/0xa90
> [  166.898389]  ? __kvmalloc_node_noprof+0x43/0xd0
> [  166.908442]  __kmalloc_node_noprof+0x216/0x3f0
> [  166.918302]  ? __kvmalloc_node_noprof+0x43/0xd0
> [  166.928354]  __kvmalloc_node_noprof+0x43/0xd0
> [  166.938021]  mlx5e_open_channels+0x5e2/0xc00
> [  166.947496]  mlx5e_open_locked+0x3e/0xf0
> [  166.956201]  mlx5e_open+0x23/0x50
> [  166.963551]  __dev_open+0x114/0x1c0
> [  166.971292]  __dev_change_flags+0xa2/0x1b0
> [  166.980378]  dev_change_flags+0x21/0x60
> [  166.988887]  do_setlink+0x38d/0xf20
> [  166.996628]  ? ep_poll_callback+0x1b9/0x240
> [  167.005910]  ? __nla_validate_parse.llvm.10713395753544950386+0x80/0xd70
> [  167.020782]  ? __wake_up_sync_key+0x52/0x80
> [  167.030066]  ? __mutex_lock+0xff/0x550
> [  167.038382]  ? security_capable+0x50/0x90
> [  167.047279]  rtnl_setlink+0x1c9/0x210
> [  167.055403]  ? ep_poll_callback+0x1b9/0x240
> [  167.064684]  ? security_capable+0x50/0x90
> [  167.073579]  rtnetlink_rcv_msg+0x2f9/0x310
> [  167.082667]  ? rtnetlink_bind+0x30/0x30
> [  167.091173]  netlink_rcv_skb+0xb1/0xe0
> [  167.099492]  netlink_unicast+0x20f/0x2e0
> [  167.108191]  netlink_sendmsg+0x389/0x420
> [  167.116896]  __sys_sendto+0x158/0x1c0
> [  167.125024]  __x64_sys_sendto+0x22/0x30
> [  167.133534]  do_syscall_64+0x63/0x130
> [  167.141657]  ? __irq_exit_rcu.llvm.17843942359718260576+0x52/0xd0
> [  167.155181]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> 
> Fixes: bb135e40129d ("net/mlx5e: move XDP_REDIRECT sq to dynamic allocation")
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> index bd41b75d246e..a814b63ed97e 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> @@ -2087,7 +2087,7 @@ static struct mlx5e_xdpsq *mlx5e_open_xdpredirect_sq(struct mlx5e_channel *c,
>   	struct mlx5e_xdpsq *xdpsq;
>   	int err;
>   
> -	xdpsq = kvzalloc_node(sizeof(*xdpsq), GFP_KERNEL, c->cpu);
> +	xdpsq = kvzalloc_node(sizeof(*xdpsq), GFP_KERNEL, cpu_to_node(c->cpu));
>   	if (!xdpsq)
>   		return ERR_PTR(-ENOMEM);
>   

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks for your patch.

Regards,
Tariq
