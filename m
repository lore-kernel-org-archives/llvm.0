Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C2B21CFE0
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 14:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692131; cv=none; b=rm9kuAeOrWDiF+dKXS7F/oHr6bEuyBJiBT9pYj7YBIjI7X1H6PE4KAEPnZCmNF4iym1keNlINSpYJDxdge0Gru6WVlfPVmWr8Q8bvt5TMlzFm3dl8j1/J8VFkEDwrokjd+fqNVlT2JAAyGUvOeJUhh+6nwaOl79kIx5gmAzLJBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692131; c=relaxed/simple;
	bh=chosfU+L3Svp2JjKX8OwFFJmo+Iu66YpusbUzCoNMck=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=p4PzUd9EbT0nC2PFjNicfgzl4bhK4WJmyhNwVa92scQwZf/NadW0ZHo4IHTTdJ7dbK5BFNvjZLniRCK11mqVi0Mr5chTHiYuYkV7tTEMmQMTNHeqcXtjcBSmBby9Dee1iSNOUd7exI3E81u6ExJ8AEHoTpwfgoeNoZVUUmLn1Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Epyi95dN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Epyi95dN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783692129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CcfJhwp3yqpTMYKuYR5JXbh2Qww2l41nmsbjm/eUZOY=;
	b=Epyi95dN6RO+X1o8clsCITouVY6/yU2ytcsrquXw8Ild5ZoQRf8IG9aIB4W+JWVSLHesiB
	mqZv1v1li7+TEwpa+O2TPHsLoWTXSmBxlCCKkisn8pc/ncmxcP/RQXzU7gxLv9K4T2rDoi
	hdwJ6MabfEJhvvbb1zSDpABoJZfi5c8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-_fJXCIcxOvOPaDXSufyuiw-1; Fri,
 10 Jul 2026 10:02:07 -0400
X-MC-Unique: _fJXCIcxOvOPaDXSufyuiw-1
X-Mimecast-MFC-AGG-ID: _fJXCIcxOvOPaDXSufyuiw_1783692127
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C563C1955F03
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 14:02:06 +0000 (UTC)
Received: from [172.20.146.15] (unknown [10.30.45.65])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 192321956095;
	Fri, 10 Jul 2026 14:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc2,
 upstream-mainline, 2c7c88a4)
Date: Fri, 10 Jul 2026 14:02:05 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <23438.126071010020702809@us-mta-195.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vty5tf9OEX67e-VutT9q_Vf2C5nu5zi6FUEZIr-XutM_1783692127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'net-7.2-rc3' of git://git.kernel.org/pub/scm=
/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2665978670

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2665978670_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2665978670_x86_64_kernel_kcidb_tool_21616023_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301



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

