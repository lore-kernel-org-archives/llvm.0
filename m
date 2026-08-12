Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FABE450401
	for <llvm@lists.linux.dev>; Wed, 12 Aug 2026 17:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557194; cv=none; b=YpunPJFLKrvS4Ik2FmNeQivloSSHhul42M+uLkkWrdEPj9Iy2RrzIs8Hq4OHXzMfIbikMAwPcZ/CQmpQUhOrdIwsqN8tNjWRhwF1hqOSetw+l07gxgbmWPVg+FNOkexf4mfmeseIqO+VGT3ITq7V2wMQCGt2M9zoZJMO87VOjHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557194; c=relaxed/simple;
	bh=sEgDxX6QLG0cJYb28s8FQDXMGhTr5GNi57Zm+LgnGFk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Se3OY1+KdK9JrrQIm6iNk4R0cjHAQDj0ToMGENCrZ1F4UxMC9oJfw41tweMk9fm93PjZeuTyTvmlzgxgTXIoqWRiFDF+v7/MVSGo1dwogzZDmo78upY9g4V+4kFONbSTty3fquTuAoFD+ZtT8iXoEbmXXhEQN6WYCCtRY8uNUtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U93MouV8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U93MouV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786557192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RJaHbXRYLKPbaNjX6oCuev/mTWI7JKMYQrd4Id1G9GQ=;
	b=U93MouV8d68uicPv/hVIgDFRqyWxSmcMsX65V7t5MHV6rgAnODPQNyeaqpiAnfC5Ku3M6g
	TdiR1qe/9k+to7NRjUtIjZUylgb2zDFnmtIEfqBY1k1xo4C6kpwOTkNOXSauytk5UM6p9I
	6DbDKAmYv9mQMmeCRaXxvL5z197oFm8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-504-2KhrrXqNOOGH_8UYErZ2Ww-1; Wed,
 12 Aug 2026 13:53:05 -0400
X-MC-Unique: 2KhrrXqNOOGH_8UYErZ2Ww-1
X-Mimecast-MFC-AGG-ID: 2KhrrXqNOOGH_8UYErZ2Ww_1786557184
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3765718009C7
	for <llvm@lists.linux.dev>; Wed, 12 Aug 2026 17:53:04 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8762C1956049;
	Wed, 12 Aug 2026 17:53:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc7,
 upstream-mainline, f5bbbfec)
Date: Wed, 12 Aug 2026 17:53:03 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <38817.126081213530500459@us-mta-504.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _t3VMt3ntWa4cBgtEnJ_jjvnNyZLEDPBbWd8c2TlPGc_1786557184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'probes-fixes-v7.2-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2751281701

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2751281701_x86_64_kernel_kcidb_tool_21850912_9
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

