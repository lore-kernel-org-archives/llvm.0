Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B970238C9
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 07:16:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 83B1C5801A1;
	Mon,  7 Mar 2022 02:16:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 07 Mar 2022 02:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1WgFWV/G5zJ1fhJnv
	Gzti+mBFX39uCDVup/6USo3MlA=; b=WBAv2tLPRu30XVgBfI1ZZ7l+OOSUUcaNg
	oqAVODAPz2uPsOiGd7C70cGNnWc31T33WMa7ZnkQ4ME9XmTFihf2LffHFvFdwN3V
	HGobInawsU6ApvYwOX8h/TxP3FHXzYBh9t8avMIRpKB+7NcpYLoLj1NPe4bUcKIu
	R2mXSzdjJr5VEik3r7cJADfzXjBdQI06h+Xd5bR5WWtJxAQuEZEpt1USumgy/BDO
	FLnPPs5vr9huGlAK82OzLEtT7cOMA0jMEyEPbp/tpYIgberPjJ6AcKO/n24HfqmD
	YE1udl6lixcH8LepweY7zPy3A8igjOD387cYz5C5JUeq3PMXrt65A==
X-ME-Sender: <xms:PLElYn4wKAPggyAWvn3wYe5TfnMmLGb6pI8ZozVG78Zf9Imp1nJ9Vw>
    <xme:PLElYs71y7NcPxU3_NjOfIsnp8H0jFRHtAVBled8yuh8DTwVFQILaAvkjZ8QR03MD
    Lod0XrwXEY9uEM>
X-ME-Received: <xmr:PLElYucU9wFXwL3gzBEnCtoCIhWzMajMjvBPBYuewdhohK7i3QVyOH2k4y_YrBw-xFJSAYIiakeg3lieZjGh_K8vb7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddufedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefkughoucfutghhihhmmhgvlhcuoehiughoshgthhesihgu
    ohhstghhrdhorhhgqeenucggtffrrghtthgvrhhnpedtffekkeefudffveegueejffejhf
    etgfeuuefgvedtieehudeuueekhfduheelteenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehiughoshgthhesihguohhstghhrdhorhhg
X-ME-Proxy: <xmx:PLElYoLc0q7QMbf_sfKy_o67zFqIm7vGcWbnuiC6x7QSEKoNYaYn5w>
    <xmx:PLElYrJzACLsvEeAUY84noYfuG87idZlyH9SoFt65rwVhB0Y1a9I1A>
    <xmx:PLElYhzLIWe1Piju9YPp1sjA2Y6LEfpfgUsHguk0q52xd1lOmJQi9g>
    <xmx:PLElYlA1FpSZgB_AwD-P_NZSTSA9Lb2UzZm9waZXPT76SwYYxoGGoA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Mar 2022 02:16:11 -0500 (EST)
Date: Mon, 7 Mar 2022 09:16:07 +0200
From: Ido Schimmel <idosch@idosch.org>
To: trix@redhat.com
Cc: davem@davemloft.net, kuba@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, idosch@nvidia.com, petrm@nvidia.com,
	edumazet@google.com, avagin@gmail.com, yajun.deng@linux.dev,
	johannes.berg@intel.com, cong.wang@bytedance.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] net: rtnetlink: fix error handling in
 rtnl_fill_statsinfo()
Message-ID: <YiWxN/TJ7nHY8OMa@shredder>
References: <20220305181346.697365-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220305181346.697365-1-trix@redhat.com>

On Sat, Mar 05, 2022 at 10:13:46AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> The clang static analyzer reports this issue
> rtnetlink.c:5481:2: warning: Undefined or garbage
>   value returned to caller
>   return err;
>   ^~~~~~~~~~
> 
> There is a function level err variable, in the
> list_for_each_entry_rcu block there is a shadow
> err.  Remove the shadow.
> 
> In the same block, the call to nla_nest_start_noflag()
> can fail without setting an err.  Set the err
> to -EMSGSIZE.
> 
> Fixes: 216e690631f5 ("net: rtnetlink: rtnl_fill_statsinfo(): Permit non-EMSGSIZE error returns")
> Signed-off-by: Tom Rix <trix@redhat.com>

For net-next:

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

Thanks
