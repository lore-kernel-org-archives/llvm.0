Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C51120E3
	for <llvm@lists.linux.dev>; Fri, 19 May 2023 19:26:42 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f3b337e842so544174e87.3
        for <llvm@lists.linux.dev>; Fri, 19 May 2023 12:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684524400; x=1687116400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GpB4KeaemkhVdvu/d2ARZdmioqBby83Vs2g6NbKJdpg=;
        b=Pw0ndM+FiV9eNFnRsYKwN3Ioonzwup94M8WIuAtXXLe0daEDX3YFW1TJIFly9m9Uhu
         Nm4JDtFiwo1JbVObhoP+acxiQmDepJNkpP+0uI7ysOmdYTo2FVxL+0nxXMnnifxcgKJQ
         s8ioIisvGR6w9566N4s1wLLV84zsRb8H8r7JicTSW/s1N84GE9mIEmX7gvuKjL8TqBTf
         GKLigZC1AQUQp4ZwEXCZzPdWdpeMjJW0RywlbxAPrqUOzqqJl4RciEvtrhk7VhMn6vYm
         Fn9Cg25+6yFIBBQbpAdOSzloSg6ufJAGkGX+qEYySz60YHij5sP+L6I77s2Y0yo8EPI0
         yNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684524400; x=1687116400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpB4KeaemkhVdvu/d2ARZdmioqBby83Vs2g6NbKJdpg=;
        b=G39OG4Emp4hhVVRO9Bt/5NExlWFZX17TFMeuQxQZbo52bowdtb6TyHrNV/h6K+9zA8
         kjj0Nags2yvkoo2YXN0NAdNjuMHY3F0aAG+61uuKe2rthVVf/BK84TTq1VzB/2akEQ0K
         hps10EFbO9hVjlR0UvZttEHu9cS9oNr1/zAFlfwySiuDTepEiVMXKAJuhoKC1yqLys/z
         R7ILpgKAasjNXEoLvfWV9k2mume2dALbIbdSjAw6O3xuf6LlOcXLBq6Q3NkgYzjPDwS3
         yrIUUUbe6LcbE7Av7teA2lwYbrc3cuShUxJjA6oHm76IXPpTKVMFg4hzOnm0gr9s6ahu
         1Z6g==
X-Gm-Message-State: AC+VfDzuQktesrLYAfMxdpSO/AGcDKqUwX0BVz+LDLwuP/i2h1If10I2
	3v/dJLtJfSG4n2VaFW1W9H2TGg==
X-Google-Smtp-Source: ACHHUZ6ADBOWW+C9I2r3mhjSH2Mgt70NPVduQ4FcaygLnkmjzTLL5hcJ/kFt8K4oJzUxMyqH2iiRUQ==
X-Received: by 2002:ac2:5491:0:b0:4f3:a446:8230 with SMTP id t17-20020ac25491000000b004f3a4468230mr1092271lfk.13.1684524400303;
        Fri, 19 May 2023 12:26:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q6-20020ac25146000000b004efff420b0asm3366lfd.108.2023.05.19.12.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 12:26:39 -0700 (PDT)
Message-ID: <1dba8a01-1eac-0bfd-ed7d-21d36495c111@linaro.org>
Date: Fri, 19 May 2023 22:26:39 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 2/4] interconnect: add clk-based icc provider support
Content-Language: en-GB
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Taniya Das <quic_tdas@quicinc.com>,
 Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-pm@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230512001334.2983048-1-dmitry.baryshkov@linaro.org>
 <20230512001334.2983048-3-dmitry.baryshkov@linaro.org>
 <ZGeyO6MRBSPf7b1y@google.com>
 <CAKwvOdn-w2QPmq9_CmpHFurWyo9DiAiMEf0wus6ufW5g+8LKGQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAKwvOdn-w2QPmq9_CmpHFurWyo9DiAiMEf0wus6ufW5g+8LKGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/05/2023 20:32, Nick Desaulniers wrote:
> On Fri, May 19, 2023 at 10:30 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> On Fri, May 12, 2023 at 03:13:32AM +0300, Dmitry Baryshkov wrote:
>>> For some devices it is useful to export clocks as interconnect providers,
>>> if the clock corresponds to bus bandwidth.
>>>
>>> For example, on MSM8996 the cluster interconnect clock should be scaled
>>> according to the cluster frequencies. Exporting it as an interconnect
>>> allows one to properly describe this as the cluster bandwidth
>>> requirements.
>>>
>>> Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Hi Dmitry,
>> Apologies if this has already been reported elsewhere, but our CI is red
>> for linux-next today for allmodconfig builds:
>>
>>>> ERROR: modpost: missing MODULE_LICENSE() in drivers/interconnect/icc-clk.o
> 
> I also suspect these 2 additional errors are related to this series?
>>> Error: ERROR: modpost: "icc_clk_register" [drivers/clk/qcom/clk-cbf-8996.ko] undefined!
>>> Error: ERROR: modpost: "icc_clk_unregister" [drivers/clk/qcom/clk-cbf-8996.ko] undefined!

Ack, thanks for the report. I will send a fix in a few hours.

> 
>>
>> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/5024096989/jobs/9011763868
>>
>> Can you PTAL?
>>
>>> ---
>>>   drivers/interconnect/Kconfig     |   6 ++
>>>   drivers/interconnect/Makefile    |   2 +
>>>   drivers/interconnect/icc-clk.c   | 168 +++++++++++++++++++++++++++++++
>>>   include/linux/interconnect-clk.h |  22 ++++
>>>   4 files changed, 198 insertions(+)
>>>   create mode 100644 drivers/interconnect/icc-clk.c
>>>   create mode 100644 include/linux/interconnect-clk.h
>>>
>>> diff --git a/drivers/interconnect/Kconfig b/drivers/interconnect/Kconfig
>>> index d637a89d4695..5faa8d2aecff 100644
>>> --- a/drivers/interconnect/Kconfig
>>> +++ b/drivers/interconnect/Kconfig
>>> @@ -15,4 +15,10 @@ source "drivers/interconnect/imx/Kconfig"
>>>   source "drivers/interconnect/qcom/Kconfig"
>>>   source "drivers/interconnect/samsung/Kconfig"
>>>
>>> +config INTERCONNECT_CLK
>>> +     tristate
>>> +     depends on COMMON_CLK
>>> +     help
>>> +       Support for wrapping clocks into the interconnect nodes.
>>> +
>>>   endif
>>> diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
>>> index 97d393fd638d..5604ce351a9f 100644
>>> --- a/drivers/interconnect/Makefile
>>> +++ b/drivers/interconnect/Makefile
>>> @@ -7,3 +7,5 @@ obj-$(CONFIG_INTERCONNECT)            += icc-core.o
>>>   obj-$(CONFIG_INTERCONNECT_IMX)               += imx/
>>>   obj-$(CONFIG_INTERCONNECT_QCOM)              += qcom/
>>>   obj-$(CONFIG_INTERCONNECT_SAMSUNG)   += samsung/
>>> +
>>> +obj-$(CONFIG_INTERCONNECT_CLK)               += icc-clk.o
>>> diff --git a/drivers/interconnect/icc-clk.c b/drivers/interconnect/icc-clk.c
>>> new file mode 100644
>>> index 000000000000..0db3b654548b
>>> --- /dev/null
>>> +++ b/drivers/interconnect/icc-clk.c
>>> @@ -0,0 +1,168 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (c) 2023, Linaro Ltd.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/device.h>
>>> +#include <linux/interconnect-clk.h>
>>> +#include <linux/interconnect-provider.h>
>>> +
>>> +struct icc_clk_node {
>>> +     struct clk *clk;
>>> +     bool enabled;
>>> +};
>>> +
>>> +struct icc_clk_provider {
>>> +     struct icc_provider provider;
>>> +     int num_clocks;
>>> +     struct icc_clk_node clocks[];
>>> +};
>>> +
>>> +#define to_icc_clk_provider(_provider) \
>>> +     container_of(_provider, struct icc_clk_provider, provider)
>>> +
>>> +static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
>>> +{
>>> +     struct icc_clk_node *qn = src->data;
>>> +     int ret;
>>> +
>>> +     if (!qn || !qn->clk)
>>> +             return 0;
>>> +
>>> +     if (!src->peak_bw) {
>>> +             if (qn->enabled)
>>> +                     clk_disable_unprepare(qn->clk);
>>> +             qn->enabled = false;
>>> +
>>> +             return 0;
>>> +     }
>>> +
>>> +     if (!qn->enabled) {
>>> +             ret = clk_prepare_enable(qn->clk);
>>> +             if (ret)
>>> +                     return ret;
>>> +             qn->enabled = true;
>>> +     }
>>> +
>>> +     return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
>>> +}
>>> +
>>> +static int icc_clk_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
>>> +{
>>> +     struct icc_clk_node *qn = node->data;
>>> +
>>> +     if (!qn || !qn->clk)
>>> +             *peak = INT_MAX;
>>> +     else
>>> +             *peak = Bps_to_icc(clk_get_rate(qn->clk));
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/**
>>> + * icc_clk_register() - register a new clk-based interconnect provider
>>> + * @dev: device supporting this provider
>>> + * @first_id: an ID of the first provider's node
>>> + * @num_clocks: number of instances of struct icc_clk_data
>>> + * @data: data for the provider
>>> + *
>>> + * Registers and returns a clk-based interconnect provider. It is a simple
>>> + * wrapper around COMMON_CLK framework, allowing other devices to vote on the
>>> + * clock rate.
>>> + *
>>> + * Return: 0 on success, or an error code otherwise
>>> + */
>>> +struct icc_provider *icc_clk_register(struct device *dev,
>>> +                                   unsigned int first_id,
>>> +                                   unsigned int num_clocks,
>>> +                                   const struct icc_clk_data *data)
>>> +{
>>> +     struct icc_clk_provider *qp;
>>> +     struct icc_provider *provider;
>>> +     struct icc_onecell_data *onecell;
>>> +     struct icc_node *node;
>>> +     int ret, i, j;
>>> +
>>> +     onecell = devm_kzalloc(dev, struct_size(onecell, nodes, 2 * num_clocks), GFP_KERNEL);
>>> +     if (!onecell)
>>> +             return ERR_PTR(-ENOMEM);
>>> +
>>> +     qp = devm_kzalloc(dev, struct_size(qp, clocks, num_clocks), GFP_KERNEL);
>>> +     if (!qp)
>>> +             return ERR_PTR(-ENOMEM);
>>> +
>>> +     qp->num_clocks = num_clocks;
>>> +
>>> +     provider = &qp->provider;
>>> +     provider->dev = dev;
>>> +     provider->get_bw = icc_clk_get_bw;
>>> +     provider->set = icc_clk_set;
>>> +     provider->aggregate = icc_std_aggregate;
>>> +     provider->xlate = of_icc_xlate_onecell;
>>> +     INIT_LIST_HEAD(&provider->nodes);
>>> +     provider->data = onecell;
>>> +
>>> +     icc_provider_init(provider);
>>> +
>>> +     for (i = 0, j = 0; i < num_clocks; i++) {
>>> +             qp->clocks[i].clk = data[i].clk;
>>> +
>>> +             node = icc_node_create(first_id + j);
>>> +             if (IS_ERR(node)) {
>>> +                     ret = PTR_ERR(node);
>>> +                     goto err;
>>> +             }
>>> +
>>> +             node->name = devm_kasprintf(dev, GFP_KERNEL, "%s_master", data[i].name);
>>> +             node->data = &qp->clocks[i];
>>> +             icc_node_add(node, provider);
>>> +             /* link to the next node, slave */
>>> +             icc_link_create(node, first_id + j + 1);
>>> +             onecell->nodes[j++] = node;
>>> +
>>> +             node = icc_node_create(first_id + j);
>>> +             if (IS_ERR(node)) {
>>> +                     ret = PTR_ERR(node);
>>> +                     goto err;
>>> +             }
>>> +
>>> +             node->name = devm_kasprintf(dev, GFP_KERNEL, "%s_slave", data[i].name);
>>> +             /* no data for slave node */
>>> +             icc_node_add(node, provider);
>>> +             onecell->nodes[j++] = node;
>>> +     }
>>> +
>>> +     onecell->num_nodes = j;
>>> +
>>> +     ret = icc_provider_register(provider);
>>> +     if (ret)
>>> +             goto err;
>>> +
>>> +     return provider;
>>> +
>>> +err:
>>> +     icc_nodes_remove(provider);
>>> +
>>> +     return ERR_PTR(ret);
>>> +}
>>> +
>>> +/**
>>> + * icc_clk_unregister() - unregister a previously registered clk interconnect provider
>>> + * @provider: provider returned by icc_clk_register()
>>> + */
>>> +void icc_clk_unregister(struct icc_provider *provider)
>>> +{
>>> +     struct icc_clk_provider *qp = container_of(provider, struct icc_clk_provider, provider);
>>> +     int i;
>>> +
>>> +     icc_provider_deregister(&qp->provider);
>>> +     icc_nodes_remove(&qp->provider);
>>> +
>>> +     for (i = 0; i < qp->num_clocks; i++) {
>>> +             struct icc_clk_node *qn = &qp->clocks[i];
>>> +
>>> +             if (qn->enabled)
>>> +                     clk_disable_unprepare(qn->clk);
>>> +     }
>>> +}
>>> diff --git a/include/linux/interconnect-clk.h b/include/linux/interconnect-clk.h
>>> new file mode 100644
>>> index 000000000000..0cd80112bea5
>>> --- /dev/null
>>> +++ b/include/linux/interconnect-clk.h
>>> @@ -0,0 +1,22 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (c) 2023, Linaro Ltd.
>>> + */
>>> +
>>> +#ifndef __LINUX_INTERCONNECT_CLK_H
>>> +#define __LINUX_INTERCONNECT_CLK_H
>>> +
>>> +struct device;
>>> +
>>> +struct icc_clk_data {
>>> +     struct clk *clk;
>>> +     const char *name;
>>> +};
>>> +
>>> +struct icc_provider *icc_clk_register(struct device *dev,
>>> +                                   unsigned int first_id,
>>> +                                   unsigned int num_clocks,
>>> +                                   const struct icc_clk_data *data);
>>> +void icc_clk_unregister(struct icc_provider *provider);
>>> +
>>> +#endif
>>> --
>>> 2.39.2
>>>
> 
> 
> 

-- 
With best wishes
Dmitry

