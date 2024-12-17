Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1207C1EE02E
	for <llvm@lists.linux.dev>; Tue, 17 Dec 2024 18:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734460989; cv=none; b=khujati3cH7tqdumvzCEXaym3r4WBjQtHrHWOyvM8QejoD1C83isD1ZKQ1XWzu7rcZw/FLykatsVkM4gjrxuuhYQcSuO5iaGFJvoKhPh/NBzjYY27QBe/ddY4iadwwVlVco5T3X1kBkAWFiLOGxSQHKKXHz78XAY1iOeN/36zqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734460989; c=relaxed/simple;
	bh=pNb6X3apU9ziuKqSXZmCJvPYBYervmpfs7vFy0Xcguw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hGXS/EE0hO95qTXLy1tf+Cu8y7hyNDm9oGu9IKSFn8LtjhDEDNM3UydH2MGKAIaXNAYcIhQDGXoIprFttXRV+S7Wq8MEw+igNLG42jJej4yabfPtYW63/HAw2dczBTk2i1VzRi3T3WFapUDxp0a18K/yjJiLvLGetQcsMHOLcpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b++Owxli; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b++Owxli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734460986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iVBfgCjRCGHwzxu6j+6qb7HbeCnW+ogXe4T16WuOtWg=;
	b=b++OwxlifrKcOQ7MUhWWMS/RJef3ycqgvofYxvNRiFsSp3oHJnK1kvtPv/grT4ZEdJ8Ewc
	RIq3csgIx1F/JU8jXU7Eif7fm9eZnT1oQ/UEHDovZb3LNv8j1g12CieTeQt8aW53Mt8Pn4
	ubRClyQo77Li9OrarcxneE1s/pkDqNQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-394-FNvO8JUGNCuhOIgMJDS5ag-1; Tue,
 17 Dec 2024 13:43:05 -0500
X-MC-Unique: FNvO8JUGNCuhOIgMJDS5ag-1
X-Mimecast-MFC-AGG-ID: FNvO8JUGNCuhOIgMJDS5ag
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A84321955EA1
	for <llvm@lists.linux.dev>; Tue, 17 Dec 2024 18:43:01 +0000 (UTC)
Received: from [172.64.12.26] (unknown [10.30.33.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4FBA930044C1;
	Tue, 17 Dec 2024 18:43:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc3,
 upstream-mainline, 55298760)
Date: Tue, 17 Dec 2024 18:43:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <69774.124121713430502898@us-mta-394.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: beHjuAqlX8KbjjpdWO4B99eGY1iZQdBHy6_MoNg0RNQ_1734460984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'ftrace-v6.13-rc3' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1592899538

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1592899538-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1592899538-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1592899538-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

