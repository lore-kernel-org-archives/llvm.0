Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A935C81
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 16:22:49 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3)
	(envelope-from <daniel@iogearbox.net>)
	id 1oZDf9-000Dui-3t; Fri, 16 Sep 2022 17:53:55 +0200
Received: from [2a02:168:f656:0:d16a:7287:ccf0:4fff] (helo=localhost.localdomain)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1oZDf8-0008AZ-HO; Fri, 16 Sep 2022 17:53:54 +0200
Subject: Re: [bpf-next v2 1/2] libbpf: Add pathname_concat() helper
To: Wang Yufen <wangyufen@huawei.com>, andrii@kernel.org, ast@kernel.org,
 martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, llvm@lists.linux.dev
References: <1663313820-29918-1-git-send-email-wangyufen@huawei.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <8011ae39-d6ba-3dfa-07f1-1a548fd24560@iogearbox.net>
Date: Fri, 16 Sep 2022 17:53:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1663313820-29918-1-git-send-email-wangyufen@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.6/26660/Fri Sep 16 09:57:04 2022)

On 9/16/22 9:36 AM, Wang Yufen wrote:
> Move snprintf and len check to common helper pathname_concat() to make the
> code simpler.
> 
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>   tools/lib/bpf/libbpf.c | 76 +++++++++++++++++++-------------------------------
>   1 file changed, 29 insertions(+), 47 deletions(-)
> 
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 3ad1392..7ab977c 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -2096,19 +2096,30 @@ static bool get_map_field_int(const char *map_name, const struct btf *btf,
>   	return true;
>   }
>   
> +static int pathname_concat(const char *path, const char *name, char *buf)
> +{
> +	int len;
> +
> +	len = snprintf(buf, PATH_MAX, "%s/%s", path, name);
> +	if (len < 0)
> +		return -EINVAL;
> +	if (len >= PATH_MAX)
> +		return -ENAMETOOLONG;
> +
> +	return 0;
> +}
> +
>   static int build_map_pin_path(struct bpf_map *map, const char *path)
>   {
>   	char buf[PATH_MAX];
> -	int len;
> +	int err;
>   
>   	if (!path)
>   		path = "/sys/fs/bpf";
>   
> -	len = snprintf(buf, PATH_MAX, "%s/%s", path, bpf_map__name(map));
> -	if (len < 0)
> -		return -EINVAL;
> -	else if (len >= PATH_MAX)
> -		return -ENAMETOOLONG;
> +	err = pathname_concat(path, bpf_map__name(map), buf);

Small nit, but would be good to not make the assumption that buf is always
PATH_MAX so lets add size_t len to pathname_concat().

> +	if (err)
> +		return err;
>   
>   	return bpf_map__set_pin_path(map, buf);
>   }
