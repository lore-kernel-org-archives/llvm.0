Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898CE2741BC
	for <llvm@lists.linux.dev>; Tue, 27 May 2025 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374931; cv=none; b=Ydm50BumvzpNFEY+w9chTMMIArUAaQVJMQVbUZaR/nj9RYJ0wgzWLuMC3lTu+NuTPlD5Jgie+Po8ukZwumEvoZmmtrx+rUGh0KjO3Y+igwn1qkk2qo+LAkZtaijZGLlxdR8yKO1rcXCLHjiTvRfjEBKUYYSRwmtld4Wfo88UGo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374931; c=relaxed/simple;
	bh=7dZJVq1q/+JWcJZEFgAjwOhtkTP6DGSUH73ftdpBetM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ZXz1FJT4Iv8USOSyFr6p9Zml03viVwFAGH2L7oIsXpDZEbHY/YT2jBHfH1/Sb31AoE2ZGGKnei4gTzDVfmnryavZIGnMUSPTM7ruv7brVnLG4JnFqZ22f/011wAwX6FwnpVPJkl6cjRV45u6qv+ts8W2lM7CNxYTSb2WHwZhBSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kl/xncBF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kl/xncBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748374928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p4XAVwZqKNQIt1eOptXpyFtfHMZDlrt1Z1uwLOcnzG8=;
	b=Kl/xncBFlCyBpO+9mCp5/FW/JuAnJhvkWsZRqSxROufO5usgRvOl/MkLYu932Hzk66E031
	ZCeTRIZRWfZvk5IQHh03IrNtA8J/yAtMQDjlP6hGlzqzl/0g9A+VgjlxUaLFHEv1HARm0o
	ou8hlDsaj/AZvT7hlrin607zysLtTAA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-PbjS-e6VOfOhj9zx3W_7uA-1; Tue,
 27 May 2025 15:42:06 -0400
X-MC-Unique: PbjS-e6VOfOhj9zx3W_7uA-1
X-Mimecast-MFC-AGG-ID: PbjS-e6VOfOhj9zx3W_7uA_1748374925
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5C07418004AD
	for <llvm@lists.linux.dev>; Tue, 27 May 2025 19:42:05 +0000 (UTC)
Received: from [172.20.250.18] (unknown [10.30.44.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10447180049D;
	Tue, 27 May 2025 19:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0,
 upstream-mainline, dd3922cf)
Date: Tue, 27 May 2025 19:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <73287.125052715420600589@us-mta-467.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FYwNC77X1AsVJ4sl8ciZe-I5rOf_Yau54tZjJisZLMA_1748374925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86_sev_for_v6.16_rc1' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1839431800

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1839431800-x86_64-kernel-debug


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

