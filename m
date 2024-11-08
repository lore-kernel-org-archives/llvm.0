Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7312233D80
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 18:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731091331; cv=none; b=kLzS9GyER5tqiBIShcGSz8u852TAm/v+06u7GBQLft44VcQF/c+uVLUAFzJjFnYNiJ5VEkyUO8DAXLW5ZJsmSUP6AE6OIJEzWy2NOevgpsjtD/S4RApTeKqaIIncNPwiddcv+O6hoCBcmOvMfkzLo3xKOqVZGC4HQteUwWoXEyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731091331; c=relaxed/simple;
	bh=s0tydscjfyW7GiJFv9Txyv3rnDzKODqeW47bo7WlQjA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lcJb0Lrn1Wwn6r+YqC9QiLS9tJW9+1fX3mVmMQJ5Uw/A2+CsYCzpu4biSWuCcKP9E7nS1xOn+XO5/gPUf4FynjOxDVAmGxUH29qaNwqxjlhh2QON25ABHajan6H+htSlPD/YMJQslMUfJrwu+fCAtSuJARD+RvGKod/tJnYYSVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JcLyixEg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JcLyixEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731091328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jV3CFzsIq9SARbJBPwuE488L56/387wssl7RWKUtMvc=;
	b=JcLyixEgkxu3KHRbkSZS6Nctq0lZ52AoEqY6VIQ8UUmKSbPMTaDFLZsewHhI3Qzmd4wtM9
	WfLxDzClOF001hH/tcBWiOphHcYyTsjBBIiGKvq/4pC4Nye19PVKsA/1zK1h+OCbjPUTM+
	IkwG+JzhzFFs21PcfgPXins6C1Yb3SI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-533-TYcUta45N1GMNiconRqXQA-1; Fri,
 08 Nov 2024 13:42:06 -0500
X-MC-Unique: TYcUta45N1GMNiconRqXQA-1
X-Mimecast-MFC-AGG-ID: TYcUta45N1GMNiconRqXQA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85FEC19560A6
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 18:42:05 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5A0D7195607C;
	Fri,  8 Nov 2024 18:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc6,
 upstream-mainline, f1dce1f0)
Date: Fri, 08 Nov 2024 18:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <20248.124110813420600779@us-mta-533.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7YC4G1Xw26Cl1AAxtMunzQB7TFZhg7nglS5yvWvEXXA_1731091325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'slab-for-6.12-rc7' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/vbabka/slab

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1533976305

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1533976305-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1533976305-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1533976305-x86_64-kernel-debug


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

