Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1471C3318
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 02:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781491931; cv=none; b=BWwXiq5ErzMgK0iv9/LHJhqoGMiqt3Iu4SN241uc8n0VbLODa8nwKNoCcn3RYUKa6DJmAewzwJIHPFD7dBEBWmpmX55z1DWMjEObSvYosB0oNuHyZ6f7wt4RIzzxZliQYH9zO4g8R0s+YqN9WFas5RjwPLhb7ofB90ORJ7Pa4ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781491931; c=relaxed/simple;
	bh=0/1Nki0s9Hu+ZCYRaqcGOmJMizxTGbLUWsG4f7SNPis=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=R/o26H18ZThlmi+9Q29PwffVIrs8XZw0h8WmSPtUeLMhq5jq/UtgidyyyhCg0oD3uFY0A6CyIdlzbdPpAgsnUWdjnJ6eIQbH5W37enAgMWCPGXXvciVUXrtwnnsadVOEpqqxtkesr+Frk8Xj/TqeBCapLApYggI2CFOFzqgLPQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y9gKKtpx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y9gKKtpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781491929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zsw2oQryK4DNOvbZcUqRaWG2rbyI0ZHqQpmAcY0fUmo=;
	b=Y9gKKtpxNYhabO6obglYdUH2Vs2WJ0IYLdknRIuW/IyBHvY1vLKTKfHMi5eNtKijjHZD72
	Ys+e/OS37n0IQ3uIfEj63gGDDNRne6S9lelMPHkHyRL2lmi69Nr7vR+9jZzJOECe5j5X9w
	n2B0YedepR+3c6DfA4PTmtrMufPlYvM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-kdVJik9wN0iDimDfvaqemw-1; Sun,
 14 Jun 2026 22:52:08 -0400
X-MC-Unique: kdVJik9wN0iDimDfvaqemw-1
X-Mimecast-MFC-AGG-ID: kdVJik9wN0iDimDfvaqemw_1781491927
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 49DDF19560B6
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 02:52:07 +0000 (UTC)
Received: from [172.20.201.113] (unknown [10.30.45.66])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CFAA61955BC0;
	Mon, 15 Jun 2026 02:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 8cd9520d)
Date: Mon, 15 Jun 2026 02:52:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <18808.126061422520800228@us-mta-695.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GoNY_naVGQIVwLK8xkwea0Z-DDRt1rGpEgcUhp4WfuE_1781491927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Linux 7.1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2600264649

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2600264649_ppc64le_kernel

One or more kernel tests failed:
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

