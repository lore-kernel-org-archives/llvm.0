Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CFB253B52
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743018131; cv=none; b=JTVjnG+XCf1BsQj+bSn506n+YDfbhb7bp3azYl1bTpjGqkMIdtuOYjfP9TZbtBeKhlWbbURyhuODLj3JmGAOEKzVw/2eAXLskXyYzibhAxvU/Sh/meqVwU6EPJfhBY2N7bCP/nv0p0alfyu70Yth/ojNuseC6r7trOLpsIplgMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743018131; c=relaxed/simple;
	bh=44YH0tWBowQpFqG7tRpphOR0p1+IQa0BlcBuENmw5PM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=FixxyLK+La3akceXxNPCO8wlns1uGhneb1AqELbet5lpm1/CuvONgi5iQ7wObNM+NCgTSZC0Ti9x6iasK+72Z21OktFwMTAtOyRywgCGumYnlpp7HAriM6x+6LjSGph2gM1voehEgTlO7ljX5xaPQhMtIF31Ha59lxwA2SGITSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OmPjdn+6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OmPjdn+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743018128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uWT5dlAIhmLoEbsiYHjojOoLZhHLOyySGLCU1JgxJek=;
	b=OmPjdn+6n3qGnyyGNQO5nfUlPjWKD5ZR6KP65DT85ZkCztYJeqd/jeOMHJrO7r3/62gWsT
	P+39KS1nZG4uAK76I3Fw6NRvT7GeC+GpKuehwUF3wBvoHbkY6ZGja7/0PgPYeQdyWB1103
	pYJjulxKlaX0jmi0hgw1PhVfrR/InMQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-FH755kfNNjqwioE5wf4fYw-1; Wed,
 26 Mar 2025 15:42:06 -0400
X-MC-Unique: FH755kfNNjqwioE5wf4fYw-1
X-Mimecast-MFC-AGG-ID: FH755kfNNjqwioE5wf4fYw_1743018126
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BE1C1801A00
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 19:42:06 +0000 (UTC)
Received: from [172.20.32.163] (unknown [10.30.44.171])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8260E1801747;
	Wed, 26 Mar 2025 19:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, f6e0150b)
Date: Wed, 26 Mar 2025 19:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <22065.125032615420700187@us-mta-402.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qcT6t9MlG3ya1REe7rAXBarJ_eOudP2jCmi552JFJDw_1743018126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mtd/for-6.15' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/mtd/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1736817157

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1736817157-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1736817157-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

