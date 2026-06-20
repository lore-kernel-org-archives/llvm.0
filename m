Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6C021A92F
	for <llvm@lists.linux.dev>; Sat, 20 Jun 2026 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781954591; cv=none; b=UvOQRmvKEhoUJibzQXZRwQJkFt9V8mjUb1elGMca+0MzZQXDxRYfZRBCq4sJZIyXxhm7Zl+rQ0Z+bcNUe1o8QRKyOVwBZEhKDp43JAoFGDFuKMD8Q+A5GP2ED59dkrBxZCbx9Y5Xus1RDQp9cd9f6cbbkLp0k7dIh1iISbk/4kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781954591; c=relaxed/simple;
	bh=i+y927VI7p4RL0X3FBeaS3SIKlwlwL3Wb70PeACVOTI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KbZHbmhhB8/2wHGk32d0yOvvYV9KlNIT0f6IqDFxRFD0A/eAuT6ONYiygP/2s6RhZvCagY19Uxr3a9eOMgrQJJiG2iLCRCknEFBWvQl6P53abaUZ9o0Pcn+EnnueOzfxfqjYMSH0EBFwWrDVVAFmjX/cc1HxSD39BbnPrp32o3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KeCTRkfS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KeCTRkfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781954588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/aD0yDsnkxVj9rveBKsl4XU9OLmXrm1fLHtSEr5Oc4A=;
	b=KeCTRkfSaLp07e2fCt0z3LLDjdgqvLjcJhuvWD75WQGWkCplFLIMSecMs5g7FE/+ADtek6
	5pxL/QAyLGAygrRsvBEviKGYmdtGRjqrK1+6TQobGRirpG3R9k+Y5d9QUmmAMiIDuH9ZuV
	yMbDxgTRfrErzDULY+9ybLXp1EfJqVE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-811WzHXHPEeDo7BPevsIgw-1; Sat,
 20 Jun 2026 07:23:07 -0400
X-MC-Unique: 811WzHXHPEeDo7BPevsIgw-1
X-Mimecast-MFC-AGG-ID: 811WzHXHPEeDo7BPevsIgw_1781954586
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FD1A1956056
	for <llvm@lists.linux.dev>; Sat, 20 Jun 2026 11:23:06 +0000 (UTC)
Received: from [172.20.103.220] (unknown [10.30.45.77])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B5E4F180058C;
	Sat, 20 Jun 2026 11:23:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 08c7183f)
Date: Sat, 20 Jun 2026 11:23:05 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <19487.126062007230700321@us-mta-179.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yvT99sxNWPl2Uh_MUvd6-xoFdLJvv8ZiRFJPynDNde4_1781954586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'mips_7.2' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/mips/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2614829145

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2614829145_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - cifsv3.11
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2614829145_x86_64_kernel_kcidb_tool_21495069_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL cifs:install_xfstests
                       =E2=9D=8C FAIL exit_code

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

