Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621459;
	b=R8+qft0srZXeANTNhEXbjRE0gvHhj2MuKZMCSxn0BC/Yn2EY4xuHiZZmFF8SUkuMIdDA
	 zhVoYc6q/Vhmp8MIt1Y1t1wo5h3X7K2m8OTCQqL7Y9jP96qUqfzeclOgJSDNflwj4oEZe
	 vluYNAb09oyOEQGZFyKm+Ez8BhG/4yUyw+OSorWDDdT/Qv1U67rQj+Vo4PlIsfPkjWx2U
	 v4gSW5rBDa/R8eNpREtsaJw8T6Y4PerHjdwjxAozLTlwFqpU3Kzf020Y5cl7IGCGcMW2v
	 wD/AX+CHiwNK/kzLfMaCay/MH1Sk9Rl7X8kscLTAF6MAgpJsyKhZobL1Mz1oVLNcW8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621459;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
	b=vMaqjfaiPAIxF/fYk1l8P95e9ThHNdAss03tBHilofPlsXEQEEl9+epNBMlkbyOCPYDe
	 xVWKYAMhFHQagGpFsdBgeO4b1wjbMGOZyJxxKQ9MftdKUzxOiY9ILCj3d1hVryE1cVn0y
	 q1C3bU9PPrAdW4Uk0eXp7Xl5Kk49gKGUY+Vx2tJPHHfznkDDIuQHFau0vCWCrFi7sdgEy
	 CUePGJy/uHVSXqEYQRNCPFCS/eHCDubeVYcZzLfYWcpTWqHlGgUYJ80E0DXYY2nCLBNOg
	 3U6NklPSJLuPUZQzRbYrIcgxSXDLr/jYHn5wR3ix/vPtIgqwip5f9mn+WSwr3MiA4jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ISpPVjVM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76FD606A31E
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 15:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ISpPVjVM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795621457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
	b=ISpPVjVM0IfDMRAzsKQFVsk0Jf03agTxOgaC7YbhfmnYp4vYDjvPGtVJJN4t28kA8aw2N/
	HKjrUadNbDeLjzJU+/MBEiGW3punruWB0617tCIWvHRBfZhU/8z6OudmkE/6jjX7MkKC/a
	+MXH0IuS5yVbaOcUS5AQZ7oYbDusyKE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-lvStyO8wPk-o-UqBbmMS0g-1; Wed, 25 Nov 2026 15:44:14 +0000
X-MC-Unique: lvStyO8wPk-o-UqBbmMS0g-1
X-Mimecast-MFC-AGG-ID: lvStyO8wPk-o-UqBbmMS0g_1795621450
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-499ca65ae87so2698305f8f.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 07:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621450; x=1796226250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
        b=D8PFYv2bi0TcNGB4DqLOB63+Wuh7N/dBCMr/Pr/jw9cB8G6rWBHRUwxONvRIjc6/0L
         FHkn+LDCsZ8+JkybZH6EDKHZ7ywydTixOQ2NPJSA7bTM+3ZuhZPNWlJNVq8/WXjBUFmt
         fF02+t7Ut4vU7/jtljXn7TmJIv4xZ+nI64grd/4cNtGvMJGYdOcAzWx39iUwEMpoIpFU
         erzLuH8CpectAmZIL5aAKJ3PQAlwkvDwG0jjQQE2pP8ctdp0Edse4RgNzUbepdlthCgh
         q/bUpWNj9VKGs8lkOCeWH5ESeGFQNd033zcisNXpk+xsoU2w46/cwQR8D5tSFXkz/GV3
         /1Ag==
X-Forwarded-Encrypted: i=1; AL+hErHA7nAR3Tn1CFMurkskrBZNmH1q4eLTSPaQQhde/yfGmCzQXURMv5kyEDDyUsURYpAjUrai@lists.linux.dev
X-Gm-Message-State: APuU4Z/bZUdz/8tI0jNRKGK0lNlgUNxcxvDH7CKXYTx/+y/KUcWa58FF
	2YEUGGuwAqyt9jsB1KBnQ9oMqS97mvxxGQqdsZu5K0bq+utCCCH1Xcac2IEpyD6HqjRlJX9jk+H
	ButfMwFKlKmI82u0T3AZcESLhzmf/hnZ8YtVtemJNZC84asPsBRrsiFI=
X-Gm-Gg: AZFdTZcMPxRdv+EnxVsJz+DlitkpvrGNT/GSQ3E540YviCCLBY0Juwhl74hXafFN5IW
	ziTUEQfxj5IK9V/gZjXTofsCIJuZfRzEH9iMEE57Hr2/yESiP4x5348J/q3kC240MlNyN58slWw
	qA/pCGDBqte8ajskLOHirqoxiwF/5dx2UUSHSJFMppGpWrbSDxK3g5ExLBg2W2XFYRrESLtyXZf
	rFkXvofQp1z1Bbm2w7CNtZO1VgVItkolbbKO4iq98NPMSTSE3ZDiaTiKHfqqZU07QPPfTugyiye
	rVZRrmmI8kBUNfCmPU4JKaHw4VSp6JRUo4lPqKVhbSKzy1bmzRkUe3B8EAV++ossiJoqtcuEPkd
	jkEQtc7O3ieV85MaYtT0PY5IeRtTYqsmlH2MEeliBHpuU3SwD7HRmMGH6wA0RZ1TBTodraSpiG2
	k+WjwXwXc2SdcksFPlJuUOALdUc+m5hb/+EO5z1e5JcVqP
X-Received: by 2002:a05:6000:40ce:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4abafd02fa0mr38342904f8f.7.1795621450472;
        Wed, 25 Nov 2026 07:44:10 -0800 (PST)
X-Received: by 2002:a05:6000:40ce:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4abafd02fa0mr38342866f8f.7.1795621450098;
        Wed, 25 Nov 2026 07:44:10 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm35600520f8f.58.2026.11.25.07.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:44:09 -0800 (PST)
Message-ID: <711567da-17c3-4ced-b7c6-e6e6b9376155@redhat.com>
Date: Wed, 25 Nov 2026 16:44:08 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] tipc: validate peer address attributes in
 tipc_nl_peer_rm()
To: Ian Rogers <irogers@google.com>, Jon Maloy <jmaloy@redhat.com>,
 Tung Quang Nguyen <tung.quang.nguyen@est.tech>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
References: <20261119170556.1518068-1-irogers@google.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119170556.1518068-1-irogers@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HpMIS0wW2rx6fk8Vu2XrqRwxAoJFBio9lHYLAt-5sdg_1795621450
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 18:05, Ian Rogers wrote:
> tipc_nl_peer_rm() documents TIPC_NLA_NET_ADDR and TIPC_NLA_NET_NODEID as
> mutually exclusive ways to identify the peer to remove, but implements
> them as two independent if-blocks with no fallback check. If a
> TIPC_NL_PEER_REMOVE netlink request provides an empty nested TIPC_NLA_NET
> attribute (or only unrelated TIPC_NLA_NET_* attributes), 'addr' remains
> uninitialized on the stack and is passed into in_own_node() and
> tipc_node_find(). Conversely, if both attributes are supplied, the second
> silently overwrites the first.
> 
> Return -EINVAL when both attributes are present or when neither is
> present.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wconditional-uninitialized enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=1 W=1 and
> -Wconditional-uninitialized; not runtime-tested over TIPC netlink.

Testing your own patch is actually required. There are a few exceptions
(i.e. h/w dependency with unavailable H/W), but this is not one of them.

Please resubmit in a few days, after actually testing the patch.

Thanks,

Paolo

