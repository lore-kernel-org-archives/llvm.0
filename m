Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F9A12CDA5
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 02:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662330; cv=none; b=DdsWei+7Gw/AgFyBm/h0kySMBr/Vrxk6AZz8Krvn+xC2zlDeG2s8LRk5ReuPyEDdR9NgXDXyH9O35Q2Cv78ZEHGm++70CYvHx+GnjS5n3mbiXtInzS0zQ9gL0DuZzBtNxZLIJ12gXghJ4QeXiqJyL4yvZa1+nGWEzwqwV+o6itU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662330; c=relaxed/simple;
	bh=Kebck4YUA2DK61Gzk1FofNywwJxVrqZWcURtbBC18Ag=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=md4E2O4Luw1evvCt5Vjme7LUkCw8v6wzonyf+pfzUJ9k8fQa43adfT/ady0uevRhmywThvPJeSW0Phz8W8SsPx93ezlPC6v3inHIa1mGj9JiDGLHGf86aSEywhJ2bZ5lRAlYpyXyZW+mifhQvvR722q9BXroTcHjqC3c9uobm+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a3QRq6Aa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a3QRq6Aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781662327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZxYwIbmV+dX+2KhGjb3Kkf5Ycev/kxg4F55eY+U2p20=;
	b=a3QRq6Aa93VhnVCXir/GBO7+/5pN3n8BMZePMliDgepgQLrI5X09LTC2+46povh5MRcJ6r
	3b9zEDz9GK5S3HEOVhVwkRbBqYwgrsKxMEGZoRpCpdFWV09k0+EPBpONP3Fxt9DVUNdCvC
	Wq94hUp2oECAWNUqY+4NinkZG8SZ/wU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-un0cOEUaOUWFIbYNDFz-3A-1; Tue,
 16 Jun 2026 22:12:06 -0400
X-MC-Unique: un0cOEUaOUWFIbYNDFz-3A-1
X-Mimecast-MFC-AGG-ID: un0cOEUaOUWFIbYNDFz-3A_1781662325
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 65E091955F1B
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 02:12:05 +0000 (UTC)
Received: from [172.20.180.65] (unknown [10.30.44.105])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D6E5D1771;
	Wed, 17 Jun 2026 02:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 6b5a2b7d)
Date: Wed, 17 Jun 2026 02:12:04 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <20020.126061622120600183@us-mta-18.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zOnGtawkxUOYR9Wztrc0L27w51VuUCBro1RMDa-8LNo_1781662325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'trace-tools-v7.2' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2605337348

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2605337348_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2605337348_x86_64_kernel_kcidb_tool_21473209_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2605337348_aarch64_kernel_kcidb_tool_21473200_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
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

