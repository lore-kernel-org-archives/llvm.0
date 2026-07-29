Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F4261B9E
	for <llvm@lists.linux.dev>; Wed, 29 Jul 2026 01:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286995; cv=none; b=VqDgXPbDUQmSIpVKvokc3thEI5mjerJSUBesyKG6/veay8Xi8Xv2M8tn5F7bpCKHNzzmlpEK7Cj+XicbdENcnnw/R2W/LDlkcuQ6bfHtkR8WTegJfHIXLyOUnj+Pq5TobslwsCc/xQpsF6m5Lw590DsOyVeKjnEswFWudwEe3Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286995; c=relaxed/simple;
	bh=2KSvviL0iZSt9ZhMiiEaUB5EWl22jihbSGGhulcPBg8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=t55lv2XjZBDM5jdvzVrnyO/18Y9ipE5cvlvGfSbIedF3s1kr9QDY+ezI8zaFNx6bZZoNDFkj0S7Ci7WcNbJpDWTELWRtlWvdJcQf12+hHx+v8Vf18w7xHuFw2F0weSNc6rRN7LBvL8vjr2bht3FmILBocMgRXCOW6pO+TlqPo/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EuRs0mkK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EuRs0mkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785286993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2vDwJqnYwZRx6iFaYCpYkn2C7nUQ83u8nAGTj35WYUc=;
	b=EuRs0mkKNoOp4a2T8RK7hZ5VUYDE1tBti2hWRmFOlYAzNFF3GBX4H/pGaTs9bQeAAi6Avy
	BJfzQrS9wZ2FE6kDdmS7y7pSxys2CStPj+nyDIlnZ3W/3kd/iA/W/XWUDeOQ9+68cpvQiX
	PBeD4+AjrOVetfQhsFoDa6C7Nn/M98o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-d6XuJA1RON6MWO3-TOTx8A-1; Tue,
 28 Jul 2026 21:03:11 -0400
X-MC-Unique: d6XuJA1RON6MWO3-TOTx8A-1
X-Mimecast-MFC-AGG-ID: d6XuJA1RON6MWO3-TOTx8A_1785286990
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C815E19560B1
	for <llvm@lists.linux.dev>; Wed, 29 Jul 2026 01:03:10 +0000 (UTC)
Received: from [172.20.176.224] (unknown [10.30.44.218])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4078219560AB;
	Wed, 29 Jul 2026 01:03:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc5,
 upstream-mainline, 3b5f4b83)
Date: Wed, 29 Jul 2026 01:03:09 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <90925.126072821031100715@us-mta-47.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m8JVIkjB3aiT0oaIIS85WmRI1ImJqAwuiub0ZSZq_kg_1785286990
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'for-7.2-rc5-tag' of git://git.kernel.org/pub=
/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2712995475

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2712995475_x86_64_kernel_kcidb_tool_21746601_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2712995475_aarch64_kernel_kcidb_tool_21746604_9
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

