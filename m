Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F271F7A
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 00:17:25 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id va17so23456671ejb.0
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 17:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oegRzPvhEXy0RuRC470612+PNk6XDdhRUUgEKb6Yhw4=;
        b=HWQ1fG98udOeFnE6AU0udN33g8gV72IHhvVYo9k/QK2jVEm0V3p6wyAu4jE2fBlif0
         pR57kKLAAeF1+z7j+Y8We1wOOi1VKwasXWwxbY+uqDu3S+U3q0X0kBAEYajNs6C9V9Mj
         8kE5kV58luSxS/+dNo/HOp/ey0XO6++0M5iUHQPaW2Pn2oEEdACf3n3zoZ8Pc3spWTGO
         RxN3T13JnI1O8xp/WyvxKmMjmgFfRDcpV6o4ezZQBvsPYZYJFkp1qQYr8jMAAuKY+mNN
         /IstELYEeO6R6O851esZUTzRYkYYrRYxIV0BpqSXdJnS7jRjUqKO6wjaUKmG/RH0thx+
         sfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oegRzPvhEXy0RuRC470612+PNk6XDdhRUUgEKb6Yhw4=;
        b=rL0liRZ/sDRqyYTJRknCbR47IzcnVRcDP0FyneSxQWe/ATM14LqzVv8aCKCjadbb/a
         FYHIuE2GgCm1sCKjWrqarLlQ9eFqBSxxtq7FB51oKfHtqQB0pwIwyzdbr6ObPpkoypbQ
         baXPKNFCwVrPbs3gr8wI/EJTNMoYz4VYyy1uqoStuUY7qlrMsVnszEdag3NSmhlL9YpM
         QLUD2kyouY8NN86LrxbIcQ0JZT/vjxzst5rNGE8gikSbP15n7aDrck9NTSrvNhN+VkeZ
         BBeSujpDyNM8nM3AGwPw/ptURmnANiGWjm3QT8MeGgb1i0NVH9V4EqmggEFTArzlgpEI
         P/hQ==
X-Gm-Message-State: AJIora9hCiODSSEVFO1I8gsNZN/78pA+62SCTzA+R+40pzx1k1/3SAC9
	C4/3rUJO1xDasiBn2R77DMg=
X-Google-Smtp-Source: AGRyM1tkSz7iPceEXBAdwCvJugSsT5xFiZNf6UVIeafmXzAA6CG19dQXYigE2LM59CGI1N5hy3nIJg==
X-Received: by 2002:a17:907:1dce:b0:72b:40c4:deec with SMTP id og14-20020a1709071dce00b0072b40c4deecmr12646645ejc.70.1658794644128;
        Mon, 25 Jul 2022 17:17:24 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id h23-20020aa7c957000000b0043bea0a48d0sm3279112edt.22.2022.07.25.17.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 17:17:23 -0700 (PDT)
Date: Tue, 26 Jul 2022 03:17:20 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [net-next PATCH v4 09/14] net: dsa: qca8k: move set age/MTU/port
 enable/disable functions to common code
Message-ID: <20220726001720.d75t26oigcdp2eca@skbuf>
References: <20220724201938.17387-1-ansuelsmth@gmail.com>
 <20220724201938.17387-1-ansuelsmth@gmail.com>
 <20220724201938.17387-10-ansuelsmth@gmail.com>
 <20220724201938.17387-10-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724201938.17387-10-ansuelsmth@gmail.com>
 <20220724201938.17387-10-ansuelsmth@gmail.com>

On Sun, Jul 24, 2022 at 10:19:33PM +0200, Christian Marangi wrote:
> The same set age, MTU and port enable/disable function are used by
> driver based on qca8k family switch.
> Move them to common code to make them accessible also by other drivers.
> While at it also drop unnecessary qca8k_priv cast for void pointers.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
> index a50c21c90e81..7e573827dac6 100644
> --- a/drivers/net/dsa/qca/qca8k-common.c
> +++ b/drivers/net/dsa/qca/qca8k-common.c
> @@ -373,3 +373,91 @@ void qca8k_port_bridge_leave(struct dsa_switch *ds, int port,
>  	qca8k_rmw(priv, QCA8K_PORT_LOOKUP_CTRL(port),
>  		  QCA8K_PORT_LOOKUP_MEMBER, BIT(cpu_port));
>  }
> +
> +int
> +qca8k_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)

Same comment about prototypes now fitting a single line. I won't be
making this comment everywhere.

> +{
> +	struct qca8k_priv *priv = ds->priv;
> +	unsigned int secs = msecs / 1000;
> +	u32 val;
> +
> +	/* AGE_TIME reg is set in 7s step */
> +	val = secs / 7;
> +
> +	/* Handle case with 0 as val to NOT disable
> +	 * learning
> +	 */
> +	if (!val)
> +		val = 1;
> +
> +	return regmap_update_bits(priv->regmap, QCA8K_REG_ATU_CTRL, QCA8K_ATU_AGE_TIME_MASK,
> +				  QCA8K_ATU_AGE_TIME(val));

Maybe now would be a good time to trim this line to 80 characters?
Networking wasn't a huge fan of the 100 character limit increase,
I think this might even be pointed out in the process docs.
