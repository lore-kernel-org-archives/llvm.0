Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665D941D20B
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 12:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575938; cv=none; b=UGw4ZZtYoCDj/HmMFtS+Ssk8r9jCDdBo6eTxtZGD+/NDgSd+1YOPG9a3wUJPJ3mSOCe/R2RXJKC6Z7h7+Rhgf75k6aDoc00+7bnhhQsXUxybKgD2a2TIYgC2a9y4lL4L5af5R7H5d5lccsvbq2iKNa8l8vyOsUaELAZdrGCqqfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575938; c=relaxed/simple;
	bh=hyljFd3OkjeLIkzjQfS6RGdVmZgc6Yb30eoTJeIJDAI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hePfM2+9Jfym/nGyIHmGPeI1F+qZ7LPWywZ9KfGAQKNx87Qb7CQI+ifBP7YHsgc8ZLDnD9tPzb+6r7tLqiKe3/rgCBmtv4+NwfhGoMpxHpFKwyV5eEUtWILGJmw6NsLriHatW70ffMoCLfP60aV7TpfzvMV6Nyaza3wehRRA2uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CE5aARvv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CE5aARvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787575936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u4jvuwYF6gejWKWJAawSWD+cCcCPJMUgBLpDrk3UJRU=;
	b=CE5aARvvNi8zU3b+BWWQ/f9J9r8WEdeZgfrldknXq6wso3qEYahaLJRnHi4CqVyqKoNGyb
	xgnGA6ZmTHneETWvCUQFmuK89fLgSH1DgujJzEzOExXL8PZiyVhjwgiFeATJ7RbMV7xb5+
	9+3fQzRQyyc/96BZf1JET268IT57JpY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-38-zCfnCJB1NcWvj-JnL7NsGQ-1; Mon,
 24 Aug 2026 08:52:14 -0400
X-MC-Unique: zCfnCJB1NcWvj-JnL7NsGQ-1
X-Mimecast-MFC-AGG-ID: zCfnCJB1NcWvj-JnL7NsGQ_1787575934
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09F91197702B
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 12:52:14 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A89137D6;
	Mon, 24 Aug 2026 12:52:13 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-0,
 upstream-mainline, 2709dd5a)
Date: Mon, 24 Aug 2026 12:52:13 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <50778.126082408521400447@us-mta-38.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4T55W6_W0MbO59BvQlleb-RounpYdI_QyGGdn-R8G78_1787575934
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'sched-urgent-2026-08-22' of git://git.kernel=
.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2782427474

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2782427474_aarch64_kernel_kcidb_tool_1200054809_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2782427474_x86_64_kernel_kcidb_tool_1200062152_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

