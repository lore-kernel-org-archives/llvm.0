Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A69332601
	for <llvm@lists.linux.dev>; Wed, 24 Jun 2026 21:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335594; cv=none; b=W+9b+bp8kOBF3k/+Gu3Q3CN+wr88owgud04n6TMB0o67S4bMxNtaU2okqmBibx0YXukFOLRIAxCopnT19M17FPjbv5B83nS52m2EKMbE/DHM5VWtqunpLwSzyRyyLicb7GedN7PPxE7itQ14ffrtVsMmlD76CFmMGNgmKwpH/n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335594; c=relaxed/simple;
	bh=6KfI0zbVNLHrjTuvRF76tcVDWcEgM93DDvh/wQsSCNI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ByVfHSzL4BehhoSYaLi+HtonLMY2rRM7OXjAiawPsWLmAZn1FnxyvnwcrWgp3Y8D1LnLzpfi7Q73Z0bvFcveiqvK47XiBAviUvZ1UQWIea7s2b2+i8fQF5E+u9iOd0a51MeRqxFg3Wn6cBc3WHV49izNqVwur8fvR3rFzqMscoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F/qfNbWT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F/qfNbWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782335592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WuInAxRKfVW6+crrJ1dayWlM0T6wdc5cp5fE9MvrD98=;
	b=F/qfNbWTtvtnIqNnrDkSpHbB4UebjvoUyhU37HrFrxdVwHlew3utrEadWgj35YdQ+ayBYw
	TENA0sNJ2HpyV26I4IpehOEBHuejWrUFU3IFytyUbERzUYWB3MkoWMkDMSdsY0P5dprhW/
	TFBkYDpiwXyzeH46UNnnw5/DXSKKULw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-446-obZR0JmqOKuL5cqUxdMn2A-1; Wed,
 24 Jun 2026 17:13:10 -0400
X-MC-Unique: obZR0JmqOKuL5cqUxdMn2A-1
X-Mimecast-MFC-AGG-ID: obZR0JmqOKuL5cqUxdMn2A_1782335590
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7999F180ACD0
	for <llvm@lists.linux.dev>; Wed, 24 Jun 2026 21:13:08 +0000 (UTC)
Received: from [172.20.208.154] (unknown [10.30.45.50])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B334D19560A1;
	Wed, 24 Jun 2026 21:13:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 2 of 88): Test report for master
 (7.1.0-0, upstream-mainline, 840ef6c7)
Date: Wed, 24 Jun 2026 21:13:04 -0000
To: llvm@lists.linux.dev, mmalik@redhat.com, omosnace@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <11424.126062417131100255@us-mta-446.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aSvzx57XPb5MtCq3a3BHzX2KimxAouzFfl4MZ_Y5K7U_1782335590
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'nfs-for-7.2-1' of git://git.linux-nfs.org/pr=
ojects/anna/linux-nfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2624587970

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2624587970_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2624587970_aarch64_kernel_kcidb_tool_21513634_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2624587970_x86_64_kernel_kcidb_tool_21513637_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2624587970_s390x_kernel_kcidb_tool_21513631_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test


Tests that were not ran because of internal issues:
    /distribution/command [s390x]
    Reboot test [s390x]


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

