Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5123436B056
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822731; cv=none; b=siCjfG8qJgZITc9H6giZhEHXKGG7yu0maBKO1gVVR+d9E67XhVXhPbONo/c4X172M+Iq/vRCXWEblYXbbiGe4hBOjp67W5lBwqfiFYr8OKcD2chzE6WdLnTR63OSbjqBcnxhepLURVv8YN5ZZVp8oTl4zjH85N3rn+1gWgkHrxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822731; c=relaxed/simple;
	bh=+C+ybIp3BnmDduKId/Uv0Gu1Q6q3686Hq6ub2b7aazY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=cCddmUjMOgocViA2JQCyn3IoYV8TnnWOoT96lJhJvZh44DOssBRind4wEpITK/44wHNFKQ6R5YhtaO47vmb93zFPMw/mJeSMfHloyhhVrc3b/deB0DfOCanb11M65uKBNObyXZ9fw+yWjGTMgqhBRC+tx0im9uynjwdVs68xQ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ScSOVKsH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ScSOVKsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773822729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UOzOZqak+ic7y3yZIGc+cTYT4LY9OLNaUZ6tXrjEU6w=;
	b=ScSOVKsH9F+/3Z/Ol1yNKnD1I3cCt/7PPdj/U0CctfAfG69jG6R7/1YK+XkHGSYpt6rGTb
	PVP20gQdK9hb3uh2tbFKV5H2z0YLP88tCkUXDwDk6kHMVqMcMrKc09K9LbeHG7FskPVaX7
	4OojdiWQq0nCdMDmOK6mWwr5XWhFhGg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-522-cA8pfCBzM_2SXXkqswCS7w-1; Wed,
 18 Mar 2026 04:32:07 -0400
X-MC-Unique: cA8pfCBzM_2SXXkqswCS7w-1
X-Mimecast-MFC-AGG-ID: cA8pfCBzM_2SXXkqswCS7w_1773822727
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D95C19560B4
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 08:32:07 +0000 (UTC)
Received: from [172.20.92.244] (unknown [10.30.44.31])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8AD8630001A1;
	Wed, 18 Mar 2026 08:32:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc4,
 upstream-mainline, f0caa1d4)
Date: Wed, 18 Mar 2026 08:32:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <27733.126031804320703090@us-mta-522.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X748vUXLabCpm7HDG1NKOcFU9oiWHg616kX_ZtFgaSo_1773822727
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'hid-for-linus-2026031701' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/hid/hid

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2391616014

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2391616014_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
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

