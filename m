Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962C818C34
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 12:21:41 +0000 (UTC)
Received: from eig-obgw-6007a.ext.cloudfilter.net ([10.0.30.247])
	by cmsmtp with ESMTP
	id jx8Zq18xUWU1ck1dkqTQyy; Sat, 23 Sep 2023 12:21:40 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id k1djqDtB6e2vMk1djqyMwT; Sat, 23 Sep 2023 12:21:39 +0000
X-Authority-Analysis: v=2.4 cv=H4zIfsUi c=1 sm=1 tr=0 ts=650ed853
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=XYAwZIGsAAAA:8 a=ag1SF4gXAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=en96eDpqHEC5cTsa0g6yfTOKsB03MEcqDobnTEbdTV0=; b=nzanB6MPlno+BPJvBU+4JqCPU7
	QPTsZvshifp0NhPTadV6aM+7kFd3BttlswHRrdKYqtODGTh631k9IWfNEfwJ6pLI6V2t4VY9eaKpg
	0yG67ZjoG9CxeRkjPkQPlXeiujqOBgKQzdbln0zwvvJn79ePiGqOVRIce/vsy5bKe8snbM/ZKfXjW
	VuTq9hD8n+vyWyYaUGqdSSUn8ab63rWutJdpVh2aFKZTXdstA5SdrUFeCbxzuhO46PunP5/jaMPy8
	RR3waj25PJApzPYm9JpvzknB+wxSaF9QUzVlJAKe286u4EZC6us6RTKVLDBax9265Ar+jbe1CICIc
	s+SYNN8Q==;
Received: from [94.239.20.48] (port=34528 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy6U-003epr-0i;
	Sat, 23 Sep 2023 03:35:06 -0500
Message-ID: <efef6075-41ca-5c12-2593-54da4d2c7f22@embeddedor.com>
Date: Sat, 23 Sep 2023 10:36:10 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] serial: 8250_pci1xxxx: Annotate struct pci1xxxx_8250 with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
Cc: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175242.work.442-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175242.work.442-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjy6U-003epr-0i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:34528
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNwwiFB+20S1IThYQQcKunagZbv1sKFqANsgS+IfDEIuhAjp3WYP5rs25cSeFDyKs21Kf+1XWc9OUt42090NlrkcU2YUIuj9gNu825rYDQHVx0ttYOXe
 wg6+UV2xAOM+lWTKpoz+4rXk+2FnIt9prBm7SRblH2LvEZ/utH99/1RxBnzPTqSYw1z+dpS4zDfVfzaRvXLWgwzz2m90h0OpYJE=



On 9/22/23 11:52, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct pci1xxxx_8250.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
> Cc: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: linux-serial@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/tty/serial/8250/8250_pci1xxxx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_pci1xxxx.c b/drivers/tty/serial/8250/8250_pci1xxxx.c
> index a3b25779d921..0da9847f3e91 100644
> --- a/drivers/tty/serial/8250/8250_pci1xxxx.c
> +++ b/drivers/tty/serial/8250/8250_pci1xxxx.c
> @@ -107,7 +107,7 @@ static const int logical_to_physical_port_idx[][MAX_PORTS] = {
>   struct pci1xxxx_8250 {
>   	unsigned int nr;
>   	void __iomem *membase;
> -	int line[];
> +	int line[] __counted_by(nr);
>   };
>   
>   static int pci1xxxx_get_num_ports(struct pci_dev *dev)
