Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D982D6E44
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 20:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554339; cv=none; b=raQlHykw+3ZycwAKCcYVC8FP+wzaudtnv0C2jcQqwyeGo+XVRG2WYC7z8gKr9QWo5GZ4dbLsSk5mRnVa+GQwV62lPXLEcWV040aR3iaKO3DAXC2kdJCsuEh4btqaMcZWVgB2yAddDkEsgI3EDN5PZFmCX1ZDzGKTEUufp4ZOBMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554339; c=relaxed/simple;
	bh=cPPGuPf4eCq3kBd8DB0jsgCKMR2rZdsFh7olxL0B0zY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tWwujmU73pZqWiwDiqJKUm3ABbs4A/F839MEkN5QsFuK5D3LLqAg49hKS3LojZjhBb9O0JKcwmDyOGfQu02ngGIyhvJg96EwLBc0BONTI5GaugeizpfrxggblPc1jSgO1Q+MykdBNMJ3PwzCjM7l0/PojYAkankPtNIyiMaRqiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jfg4TWhx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jfg4TWhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781554337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3QYrW44YXrOYEbmMsP1nQY1tV8Gc9dYF9dy1Jk5oBYY=;
	b=Jfg4TWhxPd+OozMrTb3aoGOSCp8cPXLemieHnRO+kDQBIdkB38hyBqf3IGJKFlbNuESvB/
	16KGkp5fjuEEfmy0fAlDipm6Xg33QMZ+QAT7DQeSITRDgjbvAIV8Bq2Nsu1isj6QS+woHv
	BO8fV3PKVvHQ/eWVfcKj6aGD+IUzrR8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-Vcljw9YLPkikwftNtvoh2g-1; Mon,
 15 Jun 2026 16:12:13 -0400
X-MC-Unique: Vcljw9YLPkikwftNtvoh2g-1
X-Mimecast-MFC-AGG-ID: Vcljw9YLPkikwftNtvoh2g_1781554333
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2B9A19540CC
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 20:12:12 +0000 (UTC)
Received: from [172.20.99.234] (unknown [10.30.44.221])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6D9F83008B3B;
	Mon, 15 Jun 2026 20:12:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 36808d5e)
Date: Mon, 15 Jun 2026 20:12:12 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <39566.126061516121300797@us-mta-224.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wJkjsBUK6jb4gU4bT_Gxa1u1JIBml99dYSl_tVeyqnI_1781554333
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'driver-core-7.2-rc1' of gitolite.kernel.org:=
pub/scm/linux/kernel/git/driver-core/driver-core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2601435696

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2601435696_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2601435696_x86_64_kernel_kcidb_tool_21465210_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2601435696_aarch64_kernel_kcidb_tool_21465216_9
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

