Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2264F3537FE
	for <llvm@lists.linux.dev>; Mon,  3 Aug 2026 23:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785798731; cv=none; b=sQmDxIatk4DxCRZ2Z6wR94n7lXOo6IVQ0CX8XshU3qyoF2+dk5wwLnX1jNwnhyfmdB1P6tOzT8yKi/SAnkTlnwlcg6BOpdh7p/6cCgwo4Hdw26xZRpzkJjskkd9YOgtFiWeK+wmBBdP2xbm29AiPNDS7NxG1F3l84wHt/N7dlhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785798731; c=relaxed/simple;
	bh=uxHnAV0cvWyxkbpLN/2m9eB7aqC0V6nNJe7B38UkZoo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Y4u3v1JhIwunAeAvUVCRcRw8Y+McBkdYD+TLxxQ/A/UjxP1CEOyuWfK6ijDkVLjQsUs/geY+x5Kd5lE8Nt1675C6Fur8IE9zVt8WyOHaH5Z5l40DN8/1NMTsGYsMduuMCdjNkPxeSyNInk/8fziRIfqNyCu/fepu2YDUXlvrCfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EUw0G3VG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EUw0G3VG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785798728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Da1m39eUYK507qCRnYL9/bXk1TvFo0I1waBcDsZqDw8=;
	b=EUw0G3VGUE3d/0sWh6wl5HWnNeDHReQgJEGM3LfGBZDiEdocP1T2tOOP9qlrDsQP9H2afK
	NDit7QA6qUIdz4S6wbOUa03B5/cqBotW7qAuvJfC5yYoPIMuki9rGwFiCuuQaoloNMX8m/
	3R9qdHP2k8SdkIJ1XDe/CATtvOP3dy8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-VyOQdCfWOeupHAIA3NBq-g-1; Mon,
 03 Aug 2026 19:12:07 -0400
X-MC-Unique: VyOQdCfWOeupHAIA3NBq-g-1
X-Mimecast-MFC-AGG-ID: VyOQdCfWOeupHAIA3NBq-g_1785798726
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84D28180044D
	for <llvm@lists.linux.dev>; Mon,  3 Aug 2026 23:12:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 244B6180044F;
	Mon,  3 Aug 2026 23:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (7.2.0-rc6,
 upstream-mainline, 848acc8f)
Date: Mon, 03 Aug 2026 23:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <14689.126080319120700308@us-mta-526.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xgo9LygT9z70_7HkrBpRRGFPrx1gMFPuk3bkygKFK8E_1785798726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'fsverity-for-linus' of git://git.kernel.org/=
pub/scm/fs/fsverity/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2728358730

One or more kernel tests failed:
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

