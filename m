Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F92E262FC0
	for <llvm@lists.linux.dev>; Sat, 18 Apr 2026 05:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776490993; cv=none; b=WG8n+LUf+OfhqKPl8Ujiq/xbGOOW1PMs1aEtuQyf8DtkGWWfijCASHqhixgg5w0a+Sxgsi7pPRXgcZWzxF3ZnQahD7QAdctHgAISkFNHiEGYYgnZDJJ401Es80dqKXC+YxLKPJ2D7E1opigwzCjiR1VRCmE6ICJMCa99JTFqshY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776490993; c=relaxed/simple;
	bh=C8UoyPYjLHsyb589WfOclVVFrFXFAP4BVDP3BZMu2ig=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DVl9Tfw/NaljgE+iuZ/AY0thEIhpUGRS64XwmrEM/jprqwfK5ETskZpsINzHBT91fJ6R4eVHPxss4IhRqGU+Fbrdm8O9rgd1bnZ0x3DDiCJc2HV3DiAdx11BhQATEaBjbk+r+v01AxAlKc7TFO6wNvdZpPhBC8WEs+C3BsRS9Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J7xe+xZ5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J7xe+xZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776490991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T4nk4mGGQ0X0cfE055A9yWJzNcDcdKzaVHFqOtl2Ke8=;
	b=J7xe+xZ57pS7rQ31wi1mMn8n2y55tH23enUd8evNme1uRsGBo/PoiCCLt3aDKq9tQCsbSq
	1ynhXBFNzh3TM17hXlLRexQDJJL0PijUgfe9ebvNX9qGjGvFdZO6paMO1IsHyyi3WTnmlS
	LlX3gM9lqpN1Hr8bwaacDr3WEtozOhU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-343-LU60LSL6PsKWqmFJPyBxzQ-1; Sat,
 18 Apr 2026 01:43:09 -0400
X-MC-Unique: LU60LSL6PsKWqmFJPyBxzQ-1
X-Mimecast-MFC-AGG-ID: LU60LSL6PsKWqmFJPyBxzQ_1776490988
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ABC67195609D
	for <llvm@lists.linux.dev>; Sat, 18 Apr 2026 05:43:08 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4F41919560B1;
	Sat, 18 Apr 2026 05:43:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-0,
 upstream-mainline, d730905b)
Date: Sat, 18 Apr 2026 05:43:08 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <19154.126041801430900171@us-mta-343.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y7XFICEPswtsX_ttIZ95Gj9SvTWZ2X0TxMeW1QYWVd4_1776490988
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'mips_7.1' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/mips/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2461071276

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2461071276_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2461071276_aarch64_kernel_kcidb_tool_21126207_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
        xfstests - cifsv3.11
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2461071276_x86_64_kernel_kcidb_tool_21126530_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/100

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
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

